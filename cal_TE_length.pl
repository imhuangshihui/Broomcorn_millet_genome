#It's used to calculate the length of TE family from EDTA

#!/usr/bin/perl
use strict;
use warnings;

my %hash_type;
my $total_length;
open NEW,"$ARGV[0]" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	next if ($array[2] =~ /long_terminal_repeat/ or $array[2] =~ /repeat_region/ or $array[2] =~ /target_site_duplication/);
	$hash_type{$array[2]} += $array[4] - $array[3] + 1;
	$total_length += $array[4] - $array[3] + 1;
}
close NEW;

print "Total length of TE is $total_length\n" ;
foreach my $key(sort keys %hash_type){
	print "$key\t$hash_type{$key}\n";
}
