import sys
for files in sys.argv[1:]:
    with open(files,'r')as fin,open('{}.cds'.format(files.rsplit('.',1)[0]),'w')as fo:
        for i in fin.readlines():
            index = eval(i.strip().split('\t')[-1])
            if index >= 0.5:
                print(i,file=fo,end='')
