#!/usr/bin/env perl
use strict;
use warnings;  # 转座子的计算器|追溯器，

die usage() if @ARGV == 0;    #需要指定三个文件，gff\twobit（二进制格式，能很快地对fasta进行操作）\output要输出的文件名
my ($gff,$twobit,$output) = @ARGV;

my %hash_LTR_sequence;
open NEW,"$gff" or die;   # 打开gff，拆分
while(<NEW>){
	chomp;
	next if (/^#/);
	my @array = split /\s+/;
	if($array[2] eq "long_terminal_repeat"){  # 如果第三列有long_terminal_repeat标识，就取两个坐标
		my $start = $array[3] - 1;          #第四列 -1 twobit的第一个开始碱基为0，要输入从01开始
		my $end = $array[4];

		system("~/shijunpeng/softwares/uscs_utils/twoBitToFa -seq=$array[0] -start=$start -end=$end $twobit ./temp.fasta"); #$array[0] 多少条染色体 输出到 temp.fasta文件

		my $seq_temp;  #处理刚刚生成的temp
		open TEMP,"./temp.fasta" or die;
		while(<TEMP>){
			chomp;
			if(/^>/){    #如果是>则不要，只需要知道序列
				next;
			}
			else{
				$seq_temp .= $_;
			}
		}
		close TEMP;

		system("rm ./temp.fasta");  # 把temp.fasta给删掉

		$array[-1] =~ /Parent=(.*);Method/;  # 把ltr取出来，long_terminal_repeat 来自于 哪个 完整的 LTR
		push @{$hash_LTR_sequence{$1}},$seq_temp;   #放到 $hash_LTR_sequence，每一个hash对应两条序列
	}
}
close NEW;

open OUT,">$output" or die;    #
print OUT "Element\tDistance\tInsertion_time\n";  # LTR名字/之间距离/

foreach my $ltr(sort keys %hash_LTR_sequence){   # 对于刚才处理的每一个ltr都要遍历
	open NEW,">./seq.fasta" or die;   # 打开一个
	print NEW ">seq1\n$hash_LTR_sequence{$ltr}[0]\n>seq2\n$hash_LTR_sequence{$ltr}[1]\n";  #一公四行，1、3大于seq的名称，2 与 4 左右两端LTR的序列
	close NEW;


	system("muscle -in ./seq.fasta -out ./seq.muscle -clwstrict");  # muscle是一个比对工具，输入 seq.fasta， 输出 seq.muscle
	system("distmat -sequence ./seq.muscle -nucmethod 2 -outfile ./seq.dist");  # distmat计算两个遗传序列间的遗传距离， 输出 seq.dist

	my $dist;  # 定义一个 变量叫 dist
	open NEW1,"./seq.dist" or die; # 读取刚刚的dist文件
	while(<NEW1>){
		chomp;
		next if (/Distance/ or /--/ or /Using/ or /^Gap/ or /^\s+$/ or /^$/);  #所有的中文、空白都不要
		my @aa = split /\s+/;
		if($aa[-1] == 1){             #
			$dist = $aa[-3]/100;
			my $time = $dist/(2*1.3*10**-8);  # 计算time，分子钟为1.3*10-8次方，两端单独的作用*2，把分子钟加倍
			print OUT "$ltr\t$dist\t$time\n";  #算出来的值给三列，分别为ltr,dist,time
		}
	}
	close NEW1;

	system("rm ./seq.fasta ./seq.muscle ./seq.dist");

}

close OUT;



sub usage{
	my $die =<<DIE;
	usage : perl *.pl Me34V_genome_ctg.cor.pseudomolecule.fa.mod.EDTA.intact.gff Me34V_genome_ctg.cor.pseudomolecule.2bit output_file
DIE
}
