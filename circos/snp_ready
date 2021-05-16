1.准备文件: MUMmer dnadiff 的输出文件out.snps，只有第二第三列都有碱基才是snp。第一列是reference的POSITION
354     .       C       51815129        9       354     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       T       51815103        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       A       51815104        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       C       51815105        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       A       51815106        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       G       51815107        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
374     .       T       51815108        0       374     56994302        83095581        1       -1      CM029037.1      CM029054.1
417     G       A       51815060        9       417     56994302        83095581        1       -1      CM029037.1      CM029054.1
426     A       G       51815051        9       426     56994302        83095581        1       -1      CM029037.1      CM029054.1
481     T       A       51814996        36      481     56994302        83095581        1       -1      CM029037.1      CM029054.1
517     C       T       51814960        32      517     56994302        83095581        1       -1      CM029037.1      CM029054.1
549     T       C       51814928        14      549     56994302        83095581        1       -1      CM029037.1      CM029054.1
563     T       C       51814914        4       563     56994302        83095581        1       -1      CM029037.1      CM029054.1

2.从out.snps文件中用vcftools提取snp[1][2]
conda activate python35  # 已将vcftools下载到该环境下
vcftools --vcf out.snps.vcf --remove-indels --out ap13.snps --recode --recode-INFO-all  # 提取ap13的snps，去掉vcf中的INDEL
成功的话会输出以下信息：
VCFtools - 0.1.16
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
        --vcf out.snps.vcf
        --recode-INFO-all
        --out ap13_specific.snps
        --recode
        --remove-indels

After filtering, kept 0 out of 0 Individuals
Outputting VCF file...
After filtering, kept 6939512 out of a possible 9833232 Sites
Run Time = 27.00 seconds
并得到一个名为ap13.snps.recode.vcf的文件
【接下来为批量操作】
cat ap13.snps.recode.vcf | awk '{if($1!~"^#"){print $1,$2}}' | awk '$1=="CM029037.1"{print}' > ./two_col/k01.txt  # 得到染色体和坐标。只有K基因组需要，N基因组和K对应。
vi k01.txt
GG  # 跳转至尾行，查看行数,比如CM029037.1的SNP一共有787491行
进入matlab,用 A = ones(787491,1)生成这么多行只有1列全都为1的文件，复制到Notepad++后传到并行
paste k01.txt ones.txt | tr ' ' '\t' > k01.d  # 合并文件

3. python3 chr_bin.py k01.d  # 拆分区间






[1]www.zxzyl.com/archives/1030将VCF文件中的突变拆分成SNP和INDEL
[2]http://vcftools.sourceforge.net/man_latest.html VCF Manual

