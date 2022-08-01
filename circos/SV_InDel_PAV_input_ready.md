The bed file is from Assemblytics

**Filter, get the Insertion and Deletion variants**

    cat my_favorite_organism.Assemblytics_structural_variants.bed | awk '$7=="Deletion" || $7=="Insertion" {print $0}' > sv_and_indel.bed

**Split SV(>50bp) and InDel(<50bp)**

    cat sv_and_indel.bed | awk '{if($5>50) print}' > sv.bed
    
    cat sv_and_indel.bed | awk '{if($5<50) print}' > indel.bed

**Filter and get the 1-1 chromosome pairs**

    cat sv.bed | awk '$1=="CM029039.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029040.1' > 2KN.sv
    cat sv.bed | awk '$1=="CM029041.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029042.1' > 3KN.sv
    cat sv.bed | awk '$1=="CM029043.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029044.1' > 4KN.sv
    cat sv.bed | awk '$1=="CM029044.1"{print}' | cut -f1,2,3,5,10 | grep 'CM029046.1' > 5KN.sv
    
    cat *.sv > all.sv
    
    cat all.sv | cut -f1-3> K.sv
    
    cat all.sv | cut -f5 > N.sv
    
**Format by vim**

    vim N.sv
    
    :%s/:/\t/g
    
    :%s/-/\t/g
    
    :%s/+//g
    
**Merge**

    cat K.sv N.sv | sort -k 1,1 -k 2,2n > sv_coverage.bed
    
**Get the SV length in each sliding window**

    bedtools coverage -a chrlen.windows -b sv_coverage.bed | cut -f1-4 > sv_density.txt
    
**This is format that circos requires**

    Chr_name(與坐標文件一致)  起始坐標    終止坐標    終止-起始+1

**Make the sliding window**

    bedtools makewindows -g chr_pos.genome -w 100000 > chr_100kb.windows
    
**Get the PAV length in each sliding window**

    bedtools coverage -a chr_100kb.windows -b LM_PAV_length.bed | cut -f1-3,5 | tr ' ' '\t' > PAV_length_new_longmi4_100kb.txt
