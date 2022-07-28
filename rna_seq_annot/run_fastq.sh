#!/bin/bash

source ~/.bashrc

conda install -c daler sratoolkit

for i in *sra
do
echo $i
fastq-dump --split-3 $i
done
