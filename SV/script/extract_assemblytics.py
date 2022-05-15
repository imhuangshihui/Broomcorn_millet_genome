import sys
import numpy as np
def p(name,i,index,num):
    with open('{}_{}_INDEL.bed'.format(name,index),'a+')as fo,open('{}_{}_SV.bed'.format(name,index),'a+')as fO:
        i = i.strip().split('\t')
        if num <= 50:
            print('{}\t{}\t{}\t{}\t{}'.format(i[0],i[1],i[2],i[4],i[9]),file=fo)
        else:
            print('{}\t{}\t{}\t{}\t{}'.format(i[0],i[1],i[2],i[4],i[9]),file=fO)
for files in sys.argv[1:]:
    name = files.rsplit('.',1)[0]
    with open(files,'r')as fin:
        for i in fin.readlines()[1:]:
            index = i.strip().split('\t')[6]
            num = eval(i.strip().split('\t')[4])
            p(name,i,index,num)
