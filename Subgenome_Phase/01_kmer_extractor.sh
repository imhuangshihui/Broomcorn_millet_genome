#!/bin/bash
file = genome.fa
file_chr = single_chromosome.fa
jellyfish count -m 13 -t 10 -s 1G -o output.jf $file or $file_chr
jellyfish dump -c -t output.jf > output.tsv
