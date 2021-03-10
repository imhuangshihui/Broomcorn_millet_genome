## It is used to calculate the number of exon, gene, mRNA and CDS in gff file.

dicts = {'exon':0, 'gene':0, 'mRNA':0, 'CDS':0, }

with open('P.virgatum_N.gff', 'r') as f:
    lines = f.readlines() # 逐行读取
    for line in lines:
        s = str(line)
  
        s_new = [str(i) for i in s.split('\t')]
        for item in dicts:
            if item in s_new:
                index = s_new.index(item)
                dicts[item] += (int(s_new[index+2]) - int(s_new[index+1]) + 1)
                break

print(dicts)
