Data: /data14/wangzhiheng/final_v2/snpEff

提取具有high effect的SNP注释信息
    cat longmi_pm_anno.vcf | awk -F '|' '$3=="HIGH"{print}' > longmi_pm_high.vcf
    
>HIGH：The variant is assumed to have high (disruptive) impact in the protein, 
>probably causing protein truncation, loss of function or triggering nonsense mediated decay

