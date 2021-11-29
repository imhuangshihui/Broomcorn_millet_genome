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



