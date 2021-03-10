# 根据.gff文件中的染色体编号将.prot.fa分成两个亚基因组

import pandas as pd

with open('Longmi_Filtered-gene.gff3.representative.protein.fa', 'r') as f:
    d1 = f.read()
    data1 = [i for i in d1.split('\n')]
    data1 = data1[0].replace(">", "")

with open('Longmi4.gff', 'r') as f:
    d2 = f.read()
    data2 = [j for j in d2.split('\n')]

f1 = open("lm1.prot.fa", "w")
f2 = open("lm2.prot.fa", "w")

arr1 = ['01', '02', '03', '05', '06', '07', '09', '13', '14', ]
arr2 = ['04', '08', '10', '11', '12', '15', '16', '17', '18', ]

for i in data1:
    for j in data2:
        if data1[i][0] == data2[j][1]:
            if data2[0] in arr1:
                f1.write(i)
                print(f1)
            elif data2[0] in arr2:
                f2.write(i)

f1.close()
f2.close()
