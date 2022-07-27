#!usr/bin/sh

## Use PAV as example

## Make sliding windows

bedtools makewindows -g chr_pos.genome -w 100000 > chr_100kb.windows

## Calculate the PAV length in each sliding window and get the circos input

bedtools coverage -a chr_100kb.windows -b LM_PAV_length.bed | cut -f1-3,5 | tr ' ' '\t' > PAV_length_new_longmi4_100kb.txt

## run circos

circos test.conf
