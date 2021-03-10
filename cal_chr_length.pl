#!/usr/bin/env perl

use strict;

my($name, %seq );
open IN, $ARGV[0];
die "Need the input fasta." if( ! defined $ARGV[0] );
while(<IN>){
        chomp;
        if( /^>(\S+)/ ){   #匹配染色体的名字
                $name = $1;
        }
        else{
                $seq{$name} .= $_;
        }
}
close IN;

print "[ INFO ] Length Infomation:\n\n";
foreach$name(sort{$a cmp $b} keys %seq ){
        print "Name: ".$name."\tLength: ".length($seq{$name})."\n";
}
print "\n";
