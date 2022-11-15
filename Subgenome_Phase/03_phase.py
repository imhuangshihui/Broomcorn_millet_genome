import sys

def cal(i):
    if i >= 2:
        return 'A'
    if i <= 0.5:
        return 'a'
    else:
        return 'x'
kmer_dict={}
chr_cor=[]
with open(sys.argv[1])as fin:
    for i in fin.readlines():
        chr1,chr2 = i.strip().split('\t')
        chr_cor.append(i.strip())
        with open(chr1)as f1,open(chr2)as f2:
            for k in f1.readlines():
                kmer,count = k.strip().split('\t')
                if kmer not in kmer_dict:
                    kmer_dict[kmer] = count
                else:
                    kmer_dict[kmer] = kmer_dict[kmer]+'\t'+count
            for k in f2.readlines():
                kmer,count = k.strip().split('\t')
                if kmer not in kmer_dict:
                    kmer_dict[kmer] = count
                else:
                    kmer_dict[kmer] = kmer_dict[kmer]+'\t'+count
index_count={}
for i in kmer_dict:
    index=''
    count_list = kmer_dict[i].strip().split('\t')
    for k in range(len(count_list)):
        if k % 2 == 0:
            indicator = (eval(count_list[k])+1)/(eval(count_list[k+1])+1)
            index += cal(indicator)
    if index not in index_count:
        index_count[index] = 1
    else:
        index_count[index] += 1
        
index_count_sort = dict(sorted(index_count.items(), key = lambda x:x[1], reverse=True))

with open('phase.out','w')as fo:
    for key,value in index_count_sort.items():
        sub1=''
        sub2=''
        if 'x' not in key:
            for i in range(len(key)):
                if key[i] == 'A':
                    sub1+=chr_cor[i].split('\t')[0].rsplit('.',1)[0]+'\t'
                    sub2+=chr_cor[i].split('\t')[1].rsplit('.',1)[0]+'\t'
                elif key[i] == 'a':
                    sub1+=chr_cor[i].split('\t')[1].rsplit('.',1)[0]+'\t'
                    sub2+=chr_cor[i].split('\t')[0].rsplit('.',1)[0]+'\t'
            print('Sub1:{}\tSub2:{}\tKmer evidence number:{}'.format(sub1,sub2,value),file=fo)
