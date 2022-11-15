import os
a = open('name_file_of_rnaseq.txt','r')
for i in a.readlines():
    i = i.strip()
    os.system('hisat2 -p 20 --dta -x ./Finalv2 -1 ./fastp/{}_fastp_1.fastq -2 ./fastp/{}_fastp_2.fastq -S ./sam/{}.sam'.format(i,i,i))
