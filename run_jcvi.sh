#!/bin/sh

# convert gff to bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name /data14/wangzhiheng/data/longmi_v2_2_version/Chr01_version/longmi_v2_subA.gff3 -o subA.bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name /data14/wangzhiheng/data/longmi_v2_2_version/Chr01_version/longmi_v2_subB.gff3.gz -o subB.bed

# Delete repeated rows in bed file 
python -m jcvi.formats.bed uniq subA.bed
python -m jcvi.formats.bed uniq subB.bed

mv subA.uniq.bed subA.bed
mv subB.uniq.bed subB.bed

ln -s V2A_cds.fa V2A_cds.fa
ln -s V2B_cds.fa V2B_cds.fa

# Get the cds sequence based on the coords from bed file
bedtools getfasta -fi longmi_v2.fa -bed subA.bed -fo testA.from.bedtools.fa
# jcvi format cds
python -m jcvi.formats.fasta format testA.from.bedtools.fa testA.from.bedtools.cds

mv testA.from.bedtools.cds subA.cds
mv testB.from.bedtools.cds subB.cds


# Update2022/05/06
#GFF to Bed
python -m jcvi.formats.gff bed --type=mRNA --key=transcript_id longmi_v2_A.gff3 > subA.bed
## Get the bed file based on different key
python -m jcvi.formats.gff bed --type=mRNA --key=Name longmi_v2_A.gff3 > subA_Name.bed
# Get the longest transcript
python -m jcvi.formats.bed uniq subA.bed
python -m jcvi.formats.bed uniq subA_Name.bed


python -m jcvi.formats.gff bed --type=mRNA --key=ID longmi_v2_A.gff3 -o subA_ID.bed
seqkit grep -f <(cut -f4 subA_ID.bed) V2A_cds.fa | seqkit seq -i > subA_ID.cds

#2022/05/24 reinstall 'last' package
conda install -y -n jcvi -c bioconda bedtools emboss last

# Pairwise synteny search
python -m jcvi.compara.catalog ortholog Longmiv2_A Longmiv2_B --no_strip_names

# Macrosynteny visualization

## Prepare the input file
vi seqids
Chr01,Chr02,Chr03,Chr05,Chr06,Chr07,Chr09,Chr13,Chr14
Chr04,Chr08,Chr10,Chr11,Chr12,Chr15,Chr16,Chr17,Chr18

vi layout
# y, xstart, xend, rotation, color, label, va,  bed
 .6,     .1,    .8,       0,      , Longmiv2_A, top, Longmiv2_A.bed
 .4,     .1,    .8,       0,      , Longmiv2_B, top, Longmiv2_B.bed
# edges
e, 0, 1, Longmiv2_A.Longmiv2_B.anchors.simple

# Create .simple file
python -m jcvi.compara.synteny screen --minspan=30 --simple Longmiv2_A.Longmiv2_B.anchors Longmiv2_A.Longmiv2_B.anchors.new

# Plot when all three input files are ready
python -m jcvi.graphics.karyotype seqids layout
