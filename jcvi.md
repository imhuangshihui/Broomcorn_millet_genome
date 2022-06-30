# convert gff to bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name /data14/wangzhiheng/data/longmi_v2_2_version/Chr01_version/longmi_v2_subA.gff3 -o subA.bed
python -m jcvi.formats.gff bed --type=mRNA --key=Name /data14/wangzhiheng/data/longmi_v2_2_version/Chr01_version/longmi_v2_subB.gff3.gz -o subB.bed

# 对bed文件去重
python -m jcvi.formats.bed uniq subA.bed
python -m jcvi.formats.bed uniq subB.bed
得到后缀为.leftover.bed和uniq.bed的文件

# 重命名，覆盖bed文件
mv subA.uniq.bed subA.bed
mv subB.uniq.bed subB.bed

# 将A和B亚基因组的cds文件链接到准备jcvi的目录
ln -s /data14/wangzhiheng/final_v2/orthofinder/panicum_sub_new/pre/V2A_cds.fa V2A_cds.fa
ln -s /data14/wangzhiheng/final_v2/orthofinder/panicum_sub_new/pre/V2B_cds.fa V2B_cds.fa

# 考虑到cds.fa文件与jcvi转换过来的bed文件gene id名称不对应，因此需要做一些转换
head -1 V2A_cds.fa 
>evm.model.Chr01.1 gene=EVM%20prediction%20Chr01.1

head -1 subA.bed 
Chr01	1729	10942	EVM prediction Chr01.1	0	-

python -m jcvi.formats.fasta format --sep='%' V2A_cds.fa V2A.cds

$ head -1 V2A.cds
>evm.model.Chr01.1 gene=EVM gene=EVM%20prediction%20Chr01.1

# 用bed的坐标从fa文件中提取cds对应的序列
ln -s /data14/wangzhiheng/data/longmi_v2_2_version/Chr01_version/longmi_v2_new_ver.fa longmi_v2.fa
bedtools getfasta -fi longmi_v2.fa -bed subA.bed -fo testA.from.bedtools.fa
# jcvi format cds
python -m jcvi.formats.fasta format testA.from.bedtools.fa testA.from.bedtools.cds
    $ head -2 testA.from.bedtools.cds 
	>Chr01:1729-10942
	CTCAAAACACACCGTGATCATCATTAAATAAATTTGAATACCCAATCCTTTTTATATAAA

	$ head -2 subA.bed 
	Chr01	1729	10942	EVM prediction Chr01.1	0	-
	Chr01	14734	18354	EVM prediction Chr01.2	0	+
# 重命名
mv testA.from.bedtools.cds subA.cds
mv testB.from.bedtools.cds subB.cds


2022/05/06
#GFF to Bed
python -m jcvi.formats.gff bed --type=mRNA --key=transcript_id longmi_v2_A.gff3 > subA.bed
不同的key
python -m jcvi.formats.gff bed --type=mRNA --key=Name longmi_v2_A.gff3 > subA_Name.bed
#提取最长转录本
python -m jcvi.formats.bed uniq subA.bed

python -m jcvi.formats.bed uniq subA_Name.bed

# seqkit根據bed文件提取cds
seqkit grep -f <(cut -f4 subA.bed) V2A_cds.fa | seqkit seq -i > subA.cds  # 空文件

#TEST
python -m jcvi.formats.gff bed --type=mRNA --key=transcript_id Aamericanus_586_v1.1.gene.gff3.gz > Aam.bed


##cds文件不爲空！
python -m jcvi.formats.gff bed --type=mRNA --key=ID longmi_v2_A.gff3 -o subA_ID.bed
seqkit grep -f <(cut -f4 subA_ID.bed) V2A_cds.fa | seqkit seq -i > subA_ID.cds
但是仍然是0 anchored

2022/05/24
# 重新安裝last
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
