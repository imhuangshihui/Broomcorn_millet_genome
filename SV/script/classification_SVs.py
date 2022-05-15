import sys
for files in sys.argv[1:]:
    name = files.split('.',1)[0]
    with open(files,'r')as fin,open('{}_50-100.bed'.format(name),'a+')as f51,open('{}_100-300.bed'.format(name),'a+')as f13,open('{}_300-500.bed'.format(name),'a+')as f35,open('{}_above500.bed'.format(name),'a+')as f500:
        for i in fin.readlines():
            index = eval(i.strip().split('\t')[3])
            if index < 100:
                print(i,file=f51,end='')
            elif 100 <= index < 300:
                print(i,file=f13,end='')
            elif 300 <= index < 500:
                print(i,file=f35,end='')
            else:
                print(i,file=f500,end='')
