#!/bin/bash

source ~/.bashrc

# Step1: harvest_finder
gt suffixerator -db FIL2.fa -indexname FIL2.fa \
-tis -suf -lcp -des -ssp -sds -dna \
gt ltrharvest -index FIL2.fa -minlenltr 100 -maxlenltr 7000 \
-mintsd 4 -maxtsd 6 -motif TGCA -motifmis 1 -similar 85 -vic 10 -seed 20 -seqids yes > FIL2.fa.harvest.scn 
LTR_FINDER_parallel -seq FIL2.fa -threads 10 -harvest_out -size 1000000 -time 300
cat genome.fa.harvest.scn genome.fa.finder.combine.scn > genome.fa.rawLTR.scn

# Step2: retriever
LTR_retriever -genome FIL2.fa -inharvest FIL2.fa.rawLTR.scn -threads 20

# Step3: run_LAI
LAI -genome FIL2.fa -intact FIL2.fa.pass.list -all FIL2.fa.out
