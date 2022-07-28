#!/bin/bash

source ~/.bashrc

hisat2-build -p 4 longmi_v2.fa v2

for i in {1..3}
do
	hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 BSS${i}.R1clean.fastq.gz -2 BSS${i}.R2clean.fastq.gz -S BSS${i}.hisat2.sam 
done

for i in {6..7}
do
	hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 CHG03046${i}.R1clean.fastq.gz -2 CHG03046${i}.R2clean.fastq.gz -S CHG03046${i}.hisat2.sam
done

for i in {2..3}
do
	hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 M${i}.R1clean.fastq.gz -2 M${i}.R2clean.fastq.gz -S M${i}.hisat2.sam
done

for i in {1..3}
do
	hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 MC${i}.R1clean.fastq.gz -2 MC${i}.R2clean.fastq.gz -S MC${i}.hisat2.sam
done

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 SRR1697309_1.fastq -2 SRR1697309_2.fastq -S SRR1697309.sam

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 SRR1697310_1.fastq -2 SRR1697310_2.fastq -S SRR1697310.sam

for two in {899..906}
do
	hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -U SRR2179${two}.fastq -S SRR2179${two}.sam
done

for num in {907..908}
do
hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 SRR2179${num}_1.fastq -2 SRR2179${num}_2.fastq -S SRR2179${num}.sam
done

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -U SRR2179952.fastq -S SRR2179952.sam

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -U SRR2179961.fastq -S SRR2179961.sam

for four in {68..73}
do
hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 SRR40691${four}_1.fastq -2 SRR40691${four}_2.fastq -S SRR40691${four}.sam
done

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 /data1/shijunpeng/data/LongMi4/20180709/LM-leaf_L2_A011.R1.clean.fastq.gz -2 /data1/shijunpeng/data/LongMi4/20180709/LM-leaf_L2_A011.R2.clean.fastq.gz -S zhangleaf.hisat2.sam

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 /data1/shijunpeng/data/LongMi4/20180709/LM-root_L2_A010.R1.clean.fastq.gz -2 /data1/shijunpeng/data/LongMi4/20180709/LM-root_L2_A010.R2.clean.fastq.gz -S zhangroot.hisat2.sam

hisat2 -p 20 --dta-cufflinks -x /data14/huangshihui/v2_annotation/index/v2 -1 /data1/shijunpeng/data/LongMi4/20180709/LM-stem_L1_A009.R1.clean.fastq.gz -2 /data1/shijunpeng/data/LongMi4/20180709/LM-stem_L1_A009.R2.clean.fastq.gz -S zhangstem.hisat2.sam


conda deactivate

source ~/.bashrc
conda activate samtools 
for i in {1..3}
do
	samtools sort -@ 20 -o BSS${i}.hisat2.bam BSS${i}.hisat2.sam
done

for i in {6..7}
do
	samtools sort -@ 20 -o CHG03046${i}.hisat2.bam CHG03046${i}.hisat2.sam
done

for i in {2..3}
do 
	samtools sort -@ 20 -o M${i}.hisat2.bam M${i}.hisat2.sam
done

for i in {1..3}
do
	samtools sort -@ 20 -o MC${i}.hisat2.bam MC${i}.hisat2.sam
done

samtools sort -@ 20 -o SRR1697309.bam SRR1697309.sam
samtools sort -@ 20 -o SRR1697310.bam SRR1697309.sam

for i in {899..908}
do
	samtools sort -@ 20 -o SRR2179${i}.bam SRR2179${i}.sam
done

samtools sort -@ 20 -o SRR2179952.bam SRR217952.sam
samtools sort -@ 20 -o SRR2179961.bam SRR2179961.sam

for i in {68..73}
do
	samtools sort -@ 20 -o SRR40691${i}.bam SRR40691${i}.sam
done

samtools sort -@ 20 -o zhangleaf.hisat2.bam zhangleaf.hisat2.sam
samtools sort -@ 20 -o zhangroot.hisat2.bam zhangroot.hisat2.sam
samtools sort -@ 20 -o zhangstem.hisat2.bam zhangstem.hisat2.sam
