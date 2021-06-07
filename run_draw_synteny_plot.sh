# 染色体1的长度 染色体2的长度 输入的坐标文件 输出文件
perl ./draw_synteny_plot.pl Subgenome1_length.txt Subgenome2_length.txt out.1coords out.1coords.SVG

# 提取出来coords文件的染色体和起始终止位置后，以其为输入文件，用merge进行过滤掉重叠部分
bedtools merge -i out.1coords.bed > filter.coords.bed  
# 第二列和第三列相减
cat filter.coords.bed | awk '{print $1,$3-$2}' > sumA.txt
# 

#
bedtools merge -i mergeA.bed -c 1 -o count > mergeA.txt

cat ./dnadiff/out.1coords | awk '{print $13,$3,$4}' | head -n 20

sort -k 1,1 -k 2,2n input.bed > input_sorted.bed
　　其中 -n 的意思是按照数值大小排序。（-n 参数在 2,2 后面， 它仅对第二列有效）

　　其中 -k 的意思是指定排序的列（域），比如说 -k 1,1  表示仅仅对第一列有效， -k 2,2n 表示仅仅对第二列按照数字排序

　　其中 -t 的意思是指定行分隔符， 这里应该是 -t $'\t', 因为默认的也是， 所以可以省略。

#提取基因的位置信息：用zrep把所有gene的那一行的坐标都提取出来了！！！
zgrep '[[:blank:]]gene[[:blank:]]' Arabidopsis_thaliana.TAIR10.44.gff3.gz | cut -f 1,4,5 | awk '{print "chr"$1"\t"$2"\t"$3}' > genes.bed
#接着用bedtools以500kb为滑窗，沿染色体创建窗口
cut -d ' ' -f 3,6 karyotype.tair10.txt | tr ' ' '\t' > tair10.genome
bedtools makewindows -g tair10.genome -w 500000 > tair10.windows
#最后统计信息
bedtools coverage -a tair10.windows -b genes.bed | cut -f 1-4 > genes_num.txt


## 在跑LAI多条分段染色体的时候用到的循环命令，但是LAI输出的文件里面本来就有分段染色体数值，所以这个不成功
#!/bin/bash

source ~/.bashrc

conda activate shijunpeng

for num in {1..35}
do
srun -n 10 /public1/home/sc80041/shijunpeng/software/LTR_retriever/LTR_retriever -threads 4 -genome GWHAAEZ00000001.${num}.fasta -infinder GWHAAEZ00000001.${num}.finder.scn
done

#得到前两列的数据后，按照师兄的办法相加！！得到总长度（也就是tair10.genome）的两列：染色体和总长

cat LM01.dsp | awk '{print $1,$2,$3,($4/100000)}'> LM01_100kb.txt  # 获取snp最后一列除以100kb的文件

# 制作gene_density的circos
zgrep '[[:blank:]]gene[[:blank:]]' /public1/home/sc80041/huangshihui/CoGe/upload2/Longmi4.gff | cut -f 1,4,5 | awk '{print $1"\t"$2"\t"$3}' > genes.bed
cut -d ' ' -f 3,6 chr_lm_circos.txt | tr ' ' '\t' > tair10.genome  # 从circos染色体制作文件chr_lm_circos.txt中提取染色体名称及其长度
source activate python35  # 内有bedtools工具
bedtools makewindows -g tair10.genome -w 100000 > tair10.windows  # 建立100kb的滑动窗口
bedtools coverage -a tair10.windows -b genes.bed | cut -f 1-4 > genes_num.txt  # 统计每一个窗口的密度










