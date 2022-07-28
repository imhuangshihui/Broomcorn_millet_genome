#!/bin/bash

source ~/.bashrc

conda activate huangshihui

stringtie SRR1697309.bam -p 20 -o SRR1697309.gtf -l SRR1697309.bam 
stringtie SRR1697310.bam -p 20 -o SRR1697310.gtf -l SRR1697310.bam 
stringtie SRR2179952.bam -p 20 -o SRR2179952.gtf -l SRR2179952.bam 
stringtie SRR2179961.bam -p 20 -o SRR2179961.gtf -l SRR2179961.bam 

for i in {899..908};
do
stringtie SRR2179${i}.bam -p 20 -o SRR2179${i}.gtf -l SRR2179${i}.bam
done

for ii in {68..73};
do
stringtie SRR40691${ii}.bam -p 20 -o SRR40691${ii}.gtf -l SRR40691${ii}.bam
done

for iii in {6..7};
do
stringtie zhangCHG${iii}.bam -p 20 -o zhangCHG${iii}.gtf -l zhangCHG${iii}.bam
done

for i in {1..3};
do
stringtie S0683_07A_CHG029556-PH141-DBJ-MC${i}.bam -p 20 -o S0683_07A_CHG029556-PH141-DBJ-MC${i}.gtf -l S0683_07A_CHG029556-PH141-DBJ-MC${i}.bam
done

for i in {1..3};
do
stringtie S0683_07A_CHG029556-PH141-DBJ-BSS${i}.bam -p 20 -o S0683_07A_CHG029556-PH141-DBJ-BSS${i}.gtf -l S0683_07A_CHG029556-PH141-DBJ-BSS${i}.bam
done

stringtie zhangleaf.bam -p 20 -o zhangleaf.gtf -l zhangleaf.bam 
stringtie zhangroot.bam -p 20 -o zhangroot.gtf -l zhangroot.bam 
stringtie zhangstem.bam -p 20 -o zhangstem.gtf -l zhangstem.bam 
