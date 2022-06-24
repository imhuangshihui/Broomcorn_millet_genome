## 根据log2(Ks)的峰值主要分布在(-2, -5)之间，计算2^-2 = 0.03125, 2^-5 = 0.25

## 对coge原始文件进行ks处于(0.03125, 0.25)这个区间的过滤，并计算ka/ks比值

    cat AB_coge.kaks | awk '{if($1!~"^#"){print}}' | awk '{if(($1>0.03125)&&($1<0.25)){print}}' | awk '{print ($2/$1),$0}' 
    | tr ' ' '\t' > ../ks_0.03125_0.25/AB_filterks.kaks
    
## 生成r绘图的输入文件species那一列

    cat AB_filterks.kaks | cut -f5 | cut -d '|' -f1 > r_input_speciesAB.txt
    
    vi
    :%s/\<1\>/LMA_LMB/g
    
## 准备r输入文件
    cat AB_filterks.kaks | cut -f1 > r_input_kaksAB.txt
    paste r_input_speciesAB.txt r_input_kaksAB.txt | tr ' ' '\t' > r_input_AB.txt

## 以上同样的操作对柳枝稷的亚基因组做一遍

## 合并两个物种文件作为r的输入文件
    cat r_input_KN.txt r_input_AB.txt > kaks_filter_r_input.txt

## 提取ka/ks>1, ka/ks<1的文件

    cat AB_filterks.kaks | awk '{if($1>1) print}' > AB_kaks_above1.gene.txt
    
    cat AB_filterks.kaks | awk '{if($1<1) print}' > AB_kaks_below1.gene.txt
    
## 使用ggplot2绘制ka/ks密度曲线

run_kaks.R
