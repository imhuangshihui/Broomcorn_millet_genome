#!bin/sh

# We filter the ks value based on the peak range(-2,-5) of log2(Ks) and get the range of ks (2^-2 = 0.03125, 2^-5 = 0.25)
cat AB_coge.kaks | awk '{if($1!~"^#"){print}}' | awk '{if(($1>0.03125)&&($1<0.25)){print}}' | awk '{print ($2/$1),$0}' | tr ' ' '\t' > ../ks_0.03125_0.25/AB_filterks.kaks
    
# Prepare the R input file
cat AB_filterks.kaks | cut -f5 | cut -d '|' -f1 > r_input_speciesAB.txt
cat AB_filterks.kaks | cut -f1 > r_input_kaksAB.txt
paste r_input_speciesAB.txt r_input_kaksAB.txt | tr ' ' '\t' > r_input_AB.txt

# Same steps if you have another species

# Merge the data from different species
cat r_input_KN.txt r_input_AB.txt > kaks_filter_r_input.txt

#ka/ks>1, ka/ks<1
cat AB_filterks.kaks | awk '{if($1>1) print}' > AB_kaks_above1.gene.txt
cat AB_filterks.kaks | awk '{if($1<1) print}' > AB_kaks_below1.gene.txt
    
## Use ggplot2 draw ka/ks density plot
R run_kaks.R
