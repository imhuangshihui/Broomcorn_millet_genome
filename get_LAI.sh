 # 取出带有特定染色体的序列号和LAI值
 cat lzj.fna.mod.out.LAI | awk '$1=="CM029037.1"{print $1,$7}' > ./chr_LAI/pvk01.LA
