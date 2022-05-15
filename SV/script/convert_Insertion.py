import sys
for files in sys.argv[1:]:
    with open(files,'r')as fin,open('{}_CI.bed'.format(files.rsplit('.',1)[0]),'w')as fo:
        for i in fin.readlines():
            i = i.strip().split('\t')
            INs = i[4].replace(':','\t').replace('-','\t').replace('+','')
            print('{}{}'.format(INs,i[3]),file=fo)
