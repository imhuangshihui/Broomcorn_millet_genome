Need two preparation file: gff file of your genome，chromosome name and its length file

**Get the coordinate of each gene from the gff file**

    zgrep '[[:blank:]]gene[[:blank:]]' genome.gff | cut -f 1,4,5 | awk '{print $1"\t"$2"\t"$3"\t"}' > genes.bed
    
**You can get the chromosome name and length file from the circos karyotype file. Notice that the chromosome name needs to be the same with the name in gff file**

    cut -d ' ' -f 3,6 karyotype.txt | tr ' ' '\t' > chrlen.genome
    
**Make 100kb sliding window by using the chromosome length**

    bedtools makewindows -g chrlen.genome -w 100000 > chrlen.windows
    
**Get gene number in each sliding window**

    bedtools coverage -a chrlen.windows -b genes.bed | cut -f1-4 > genes_density.txt

