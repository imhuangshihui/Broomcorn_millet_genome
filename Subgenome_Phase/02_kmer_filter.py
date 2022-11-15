import sys
kmerlist=[]
with open(sys.argv[1])as fin:
    for i in fin.readlines():
        kmer,count = i.strip().split('\t')
        if eval(count) >= 100:
            kmerlist.append(kmer)
for files in sys.argv[2:]:
    with open(files)as fin,open('{}.kmer'.format(file.rsplit('.',1)[0]),'w')as fo:
        kmer_dict={}
        for i in fin.readlines():
            kmer,count = i.strip().split('\t')
            kmer_dict[kmer]=count
        for i in kmerlist:
            if i in kmer_dict:
                print('{}\t{}'.format(i,kmer_dict[i]),file=fo)
            else:
                print('{}\t0'.format(i),file=fo)