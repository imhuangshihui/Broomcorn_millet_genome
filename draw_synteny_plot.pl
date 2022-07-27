
#!/usr/bin/env perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;

my ($length1,$length2,$coords,$SVG) = @ARGV;

my $svg = SVG->new(width=>1000, height=>600);

my %hash_length1;
my $cal1;
my $add1 = 0;
my %hash_add1;

open NEW,"$length1" or die;
while(<NEW>){
	chomp;
	next if (/Subgenome/);
	my @array = split /\s+/;
	$cal1++;
	$hash_length1{$array[0]} = $cal1;
	$svg->line(x1=>102+$add1,y1=>500,x2=>102+$add1+$array[1]/1000000,y2=>500,stroke=>'black',"stroke-width"=>2);
	$hash_add1{$array[0]} = $add1;
	$add1+=(5+$array[1]/1000000);
}
close NEW;

my %hash_length2;
my $cal2;
my $add2 = 0;
my %hash_add2;

open NEW,"$length2" or die;
while(<NEW>){
	chomp;
	next if (/Subgenome/);
	my @array = split /\s+/;
	$cal2++;
	$hash_length2{$array[0]} = $cal2;
	$svg->line(x1=>100,y1=>500-$add2,x2=>100,y2=>500-$add2-$array[1]/1000000,stroke=>'black',"stroke-width"=>2);
	$hash_add2{$array[0]} = $add2;
	$add2+=(5+$array[1]/1000000);
}
close NEW;

open NEW,"$coords" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	##########   the orthologous chromosome
	if($hash_length1{$array[-2]} == $hash_length2{$array[-1]}){
		$svg->circle(cx => 102+$hash_add1{$array[-2]}+$array[0]/1000000, cy => 500-$hash_add2{$array[-1]}-$array[2]/1000000, r => 0.5, fill => "black");
	}
	else{
		$svg->circle(cx => 102+$hash_add1{$array[-2]}+$array[0]/1000000, cy => 500-$hash_add2{$array[-1]}-$array[2]/1000000, r => 0.5, fill => "grey");
	}
}
close NEW;


my $out = $svg->xmlify;
open SVGFILE,">$SVG" or die;
print SVGFILE $out;
close SVGFILE;


sub usage{
	my $die =<<DIE;
	usage : perl *.pl Subgenome1_length Subgenome2_length out.1coords out.1coords.SVG
DIE
}
