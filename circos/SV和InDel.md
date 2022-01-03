从Assemblytics的输出结果bed文件中提取

**去掉除了INDEL的部分**

    cat my_favorite_organism.Assemblytics_structural_variants.bed | awk '$7=="Deletion" || $7=="Insertion" {print $0}' > sv_and_indel.bed

**根据size的大小区分SV和InDel**

    cat sv_and_indel.bed | awk '{if($5>50) print}' > sv.bed
    
    cat sv_and_indel.bed | awk '{if($5<50) print}' > indel.bed

**过滤，去掉不是成对染色体的比对**

    cat sv.bed | awk '$1=="CM029039.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029040.1' > 2KN.sv
    cat sv.bed | awk '$1=="CM029041.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029042.1' > 3KN.sv
    cat sv.bed | awk '$1=="CM029043.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029044.1' > 4KN.sv
    cat sv.bed | awk '$1=="CM029044.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029046.1' > 5KN.sv
    
    cat *.sv > all.sv
    
    cat all.sv | cut -f1-3> K.sv
    
    cat all.sv | cut -f5 > N.sv
    
**利用vim的替换功能，得到与之成套的染色体的坐标信息**

    vim N.sv
    
    :%s/:/\t/g
    
    :%s/-/\t/g
    
    :%s/+//g
    
**合并后得到coverage的输入文件**

    cat K.sv N.sv | sort -k 1,1 -k 2,2n > sv_coverage.bed
    
**统计滑动窗口内的sv密度**

    bedtools coverage -a chrlen.windows -b sv_coverage.bed | cut -f1-4 > sv_density.txt
