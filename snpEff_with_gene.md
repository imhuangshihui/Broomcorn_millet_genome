Data: /data14/wangzhiheng/final_v2/snpEff

提取具有high effect的SNP注释信息

    cat longmi_pm_anno.vcf | awk -F '|' '$3=="HIGH"{print}' > longmi_pm_high.vcf
    
>HIGH：The variant is assumed to have high (disruptive) impact in the protein, 
>probably causing protein truncation, loss of function or triggering nonsense mediated decay

找出其突变类型

    cat longmi_pm_high.vcf | cut -d '|' -f2 | sort | uniq -c
    
    ![图片](https://user-images.githubusercontent.com/76728625/157154104-f59ac0a2-5bbe-4c0d-8d46-b8b4c4d15f3b.png)

根据每一个突变类型，计算它影响的基因数量（有多个Uniq的Gene ID），再根据Gene ID从gff文件中找到其对应的坐标，不需要用Bedtools了

比如根据突变类型为“stop_gained”得到的基因ID为360个, 与之前用bedtools intersect（369个）得到的有些出入

    cat longmi_pm_high.vcf | awk -F '|' '$2=="stop_gained"{print $5}' | sort | uniq -c | wc -l
    
![图片](https://user-images.githubusercontent.com/76728625/157161647-a76b4b14-db7a-4b60-81e5-d93c47030dc2.png)



    
