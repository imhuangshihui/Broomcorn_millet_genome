#!/usr/bin/perl
use strict;
use warnings;

die usage() if @ARGV == 0;
my ($fasta,$bin_size,$step_size,$output) = @ARGV;

my $sequence_name;
my %hash_sequence;
open NEW,"$fasta" or die;
while(<NEW>){
	chomp;
	if(/>/){
		my @aa = split /\s+/;
		$sequence_name = $aa[0];
	}
	else{
		$hash_sequence{$sequence_name} .= $_;
	}
}
close NEW;

## extract each sequence
open NEW,">$output" or die;
foreach my $key(keys %hash_sequence){
	my $sequence = $hash_sequence{$key};
	for(my $number = 0;$number <= length($sequence);$number+=$step_size){
		if(($number + $bin_size) <= length($sequence)){
			my $start = $number + 1;
			my $end = $number + $bin_size;
			my $subseq = substr($sequence,$number,$bin_size);
			print NEW "$key:$start-$end\n$subseq\n";
		}
	}
}
close NEW;


sub usage{
	my $die =<<DIE;
	usage : perl *.pl *.fasta bin_size step_size output
DIE
}
