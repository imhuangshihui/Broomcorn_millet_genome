circos圈图绘制所需要的snp indel信息来源于MUMmer,SV来源于Assemblytics

/data14/wangzhiheng/final_v2/mummer

安装Biopython Module：conda install -c conda-forge biopython

download all2vcf: git clone https://github.com/MatteoSchiavinato/all2vcf.git


./all2vcf mummer --snps longmi_A_ref_B_dnadiff.snps --reference longmi_v2.fa --type SNP > longmiv2_ab_snps.vcf


all2vcf mummer [OPTIONS]

--snps              Mummer "snps" file from 'show-snps -T'                  [mandatory]

--reference         Reference genome FASTA file                             [mandatory]

--type              Restrict the output to SNP|INDEL|ALL                    [ALL]

--head-in           Use this flag if the file has a header                  [off]

--head-out          Add a newly-generated VCF header to the output          [off]

--no-Ns             Exclude variants featuring Ns                           [off]


**get_snp_vcf.sh**

    all2vcf mummer --snps lzj_K_ref_N_dnadiff.snps --reference lzj.fna --type SNP > lzj_subgenome_snps.vcf
    
    python mummer2vcf2circos.py
    
**需要修改mummer2vcf2circos.py中的输入文件和输出文件名称**



