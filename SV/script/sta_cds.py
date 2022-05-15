import sys
# Usage python3 script.py file.gff3 file_of_coverage_files 
mRNA={}
gene={}
with open(sys.argv[1],'r')as fin:
    gk=''
    mk=''
    for i in fin.readlines():
        index = i.strip().split('\t')[2]
        if index == "gene":
            gk = i.strip().split('\t')[-1].split('ID=')[1].split(';')[0]
        elif index == 'mRNA':
            mk = i.strip().split('\t')[-1].split(';')[0].split('ID=')[1].split(';')[0]
            gene[mk]=gk
        elif index == 'CDS':
            cds = eval(i.strip().split('\t')[4])-eval(i.strip().split('\t')[3])
            if mk not in mRNA:
                mRNA[mk] = cds+1
            else:
                mRNA[mk] += cds+1
for files in sys.argv[2:]:
    CDS={}
    name = files.rsplit('.',1)[0]
    with open(files,'r')as f,open('{}.gene'.format(name),'w')as fo:
        for i in f.readlines():
            ID = eval(i.strip().split('\t')[10])
            Pa = i.strip().split('\t')[8].split('Parent=')[1].split(';')[0]
            if Pa not in CDS:
                CDS[Pa] = ID
            else:
                CDS[Pa] += ID

        for i in CDS:
            num_p = CDS[i]/mRNA[i]
            if num_p>=0.5:
                print('{}\t{}\t{}'.format(gene[i],i,num_p),file=fo)

