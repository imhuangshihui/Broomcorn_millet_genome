#!/bin/sh

# Raw input file is from CoGe output "Results with synonymous/non-synonymous rate values"

# Full pipeline
cat raw.ks | awk '{if($1!~"^#"){print $1}}' | awk '{print log($1)/log(2)}'|awk '{if ($1 != "0"){print $1}}'| awk '{gsub(/-inf/,"-10");print $1}' > output.ks

# Seperated steps
# Neglect rows started with '#', and extract the first Ks column
awk '{if($1!~"^#"){print $1}}' Longmi4.ks    
# Use '2' as the log($1)/log(2)
awk '{print log($1)/log(2)}' 
# Don't calculate if come across '0'
awk '{if ($1 != "0"){print $1}}'
# Replace all '-inf'(product of calculation of non-zero) to '-10'
awk '{gsub(/-inf/,"-10");print $1}'
