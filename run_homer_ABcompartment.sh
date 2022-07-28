#!/bin/bash

source ~/.bashrc

makeTagDirectory sample1-HiC -format HiCsummary sample1.homer -tbp 1
makeTagDirectory sample2-HiC -format HiCsummary sample2.homer -tbp 1

# -tbp 1 : (Removes Clonal/PCR duplicates). This is the one filtering step recommended for ALL Hi-C experiments. Please not that if the experiment has high clonality rates (medianReadsPerPosition > 1 in the tagInfo.txt file), then it is not recommended to sequence the library any more and extra scrutiny should be applied when considering the overall experiment quality.
# You can also combine Hi-C tag directories or add *tags.tsv files, just like with the regular makeTagDirectory command.  For example, to combine directories:

    #makeTagDirectory ES-HiC-All -d ES-HiC-rep1/ ES-HiC-rep2/ ES-HiC-rep3/ -tbp 1
makeTagDirectory sample_merge -d /homer/sample1-HiC/ /homer/sample2-HiC/ -tbp 1  


# To perform PCA analysis with HOMER, use the program runHiCpca.pl.  Below is an example:
#            runHiCpca.pl <outputPrefix> <HiC Tag Directory> [options]
#        example: runHiCpca.pl pcaOut ES-HiC/ -res 50000 -cpu 4 -genome mm9

runHiCpca.pl sample1_100kb_pca ./sample1-HiC -res 100000 -window 200000 -cpu 4 -genome longmiv2
runHiCpca.pl sample2_100kb_pca ./sample2-HiC -res 100000 -window 200000 -cpu 4 -genome longmiv2
runHiCpca.pl sample1_300kb_pca ./sample1-HiC -res 300000 -window 600000 -cpu 4 -genome longmiv2
runHiCpca.pl sample2_300kb_pca ./sample2-HiC -res 300000 -window 600000 -cpu 4 -genome longmiv2
runHiCpca.pl sample1_500kb_pca ./sample1-HiC -res 500000 -window 1000000 -cpu 4 -genome longmiv2
runHiCpca.pl sample2_500kb_pca ./sample2-HiC -res 500000 -window 1000000 -cpu 4 -genome longmiv2

#To compare multiple experiments, first run runHiCpca.pl on each tag directory. Once you have several PCA analysis from multiple experiments, you can combine their quantification into a single spreadsheet:
#annotatePeaks.pl HiCExp1TagDir/HiCExp1TagDir.PC1.txt hg38 -noblanks -bedGraph HiCExp1TagDir/HiCExp1TagDir.PC1.bedGraph HiCExp2TagDir/HiCExp2TagDir.PC1.bedGraph HiCExp3TagDir/HiCExp3TagDir.PC1.bedGraph > output.txt

