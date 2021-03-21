#!/usr/bin/perl
use strict;
use warnings;

my $seq;
my $cal = 0;
my $file_cal = 0;
my $add_length = 0;

open NEW,"$ARGV[0]" or die;
while(<NEW>){
	chomp;
	if(/^>/){
		my @array = split /\s+/;
		$array[0] =~ s/>//;
		$seq = $array[0];
		$cal = 0;
		$add_length = 0;
		$file_cal = 0;
	}
	else{
		$cal++;
		if($cal == 1){
			$file_cal++;
			open NEW1,">$seq.$file_cal.fasta" or die;
			print NEW1 ">$seq.$file_cal\n";
			print NEW1 "$_\n";
			$add_length+=length($_);
		}
		else{
			$add_length+=length($_);
			print NEW1 "$_\n";
			if($add_length > 2000000){
				$cal = 0;
				$add_length = 0;
			}
		}
	}
}
close NEW;
