以longmi4和pm0309的比较为例，计算在bedtools切分的每一个窗口中SNP出现的数量（第四列），最后再将这些数量相加除以窗口的个数求平均，也就是每一个100kb的窗口内出现SNP的数量的平均值为110.63

    bedtools coverage -a ../chr100kb.windows -b lm.snp.coverage.bed | head
    
    Chr01	0	100000	24	24	100000	0.0002400
    
    Chr01	100000	200000	37	37	100000	0.0003700
    
    Chr01	200000	300000	28	28	100000	0.0002800
    
    Chr01	300000	400000	15	15	100000	0.0001500
    
    Chr01	400000	500000	13	13	100000	0.0001300
    
    bedtools coverage -a ../chr100kb.windows -b lm.snp.coverage.bed | awk '{sum+=$4}END{print sum/NR}'
    
    110.63

对第四列的SNP数量进行降序排序，并统计每一个窗口内SNP出现的次数

    bedtools coverage -a ../chr100kb.windows -b lm.snp.coverage.bed | cut -f4 | sort -r | uniq -c > snp_density_excel_plot.txt
    
以不同的阈值判定hotspot的划分，结果显示：

>SNP个数<=110的100kb窗口共有5966个，SNP个数>=110的100kb窗口有2414个

>SNP个数>=900的100kb窗口有101个

>SNP个数>1000的100kb窗口有71个

以“每个100Kb窗口内SNP个数>1000”作为hotspot的考虑对象

    bedtools coverage -a ../chr100kb.windows -b lm.snp.coverage.bed | awk '{if ($4>1000) print}' > snplargerthan1000.txt
    
![图片](https://user-images.githubusercontent.com/76728625/157382001-4f09014c-0f0b-4b1a-99f7-41df6d41a458.png)

17号染色体数目最多（31个），与其对应的13号染色体只有一个窗口的SNP数量在1000以上

![图片](https://user-images.githubusercontent.com/76728625/157382292-21943067-6599-4715-afe3-3dd7c8529dce.png)

其次是7号染色体，于其对应的16号染色体没有出现Hotspot 

![图片](https://user-images.githubusercontent.com/76728625/157383037-0809d059-12f4-4097-b17e-26c11950b0f3.png)

其余染色体情况

**而作为circos的SNP输入文件，则是将mummer得到的文件进行筛选后得到只有SNP的vcf文件，将此文件作为python脚本的Input进行计算**

**得到的是每个窗口内的SNP密度（而非数量）**

> chrname   start   end snp_density_in_this_bin_size

    # Returns the number of snps between l and m, divided by region size
    def density_region(self, l, m):
        count = 0
        for location in self.locations_to_snps:
            if location >= l and location <= m:
                count += 1
        return 1000*count/float(m-l+1)

输入circos的结果如下：

> Chr01	1	100000	21.29
>Chr01	100001	200000	21.72
>Chr01	200001	300000	16.55
>Chr01	300001	400000	23.17
>Chr01	400001	500000	25.1
>Chr01	500001	600000	19.13

