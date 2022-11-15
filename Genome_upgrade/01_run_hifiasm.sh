#!/bin/bash
file1 = longmi4_hifi.fastq
hifiasm -o longmi.asm -t48 $file1 2> longmi.asm.log
