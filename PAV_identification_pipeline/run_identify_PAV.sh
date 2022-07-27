#!/bin/sh

source ~/.bashrc

# In this example, we used LongmiA as the bwa index and splited LongmiB genome

# perl *.pl *.fasta bin_size step_size output  
perl split_sequence_into_bins.pl LongmiB.fa 500 100 PAV_split_LongmiB.fa

# Build index
bwa index LongmiA.fa -p LongmiA_index

# Use bwa mem to map. Sam to bam file.
bwa mem -t 10 -w 500 -M index_name ./PAV_split_LongmiB.fa | samtools view -b -o ./PAV_split_LongmiA.bwa_mem.genome.bam

# view the bam file
samtools view -h PAV_split_LongmiA.bwa_mem.genome.bam | less -S   

# -f 4：find unmapped sequence and extract the coords
samtools view -f 4 PAV_split_LongmiA.bwa_mem.genome.bam | awk '{print $1}' > chr_coords.txt   
cat chr_coords.txt | awk -F ':' '{print $1}' > chr.txt
cat chr_coords.txt | awk -F ':' '{print $2}' | awk -F '-' '{print $1}' > coords1.txt  
cat chr_coords.txt | awk -F ':' '{print $2}' | awk -F '-' '{print $2}' > coords2.txt  
paste chr.txt coords1.txt coords2.txt > wait_sort.bed
sort -k 1,1 -k 2,2n wait_sort.bed > sorted.bed
conda activate huangshihui
bedtools merge -i sorted.bed > LongmiB_PAV.txt
