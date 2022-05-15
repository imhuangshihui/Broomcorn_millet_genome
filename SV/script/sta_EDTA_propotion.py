import sys
for files in sys.argv[1:]:
    name = files.rsplit('.',1)[0]
    with open('{}.bed'.format(name))as fbed,open('{}.edta'.format(name))as fedta:
        total = 0
        for i in fbed.readlines():
            total += eval(i.strip().split('\t')[3])
        d = {}
        for i in fedta.readlines():
            i = i.strip().split('\t')
            index = i[8].split('Classification=')[1].split(';')[0]
            num = eval(i[-3])
            typ = i[2]
            if typ != 'repeat_region':
                if index not in d:
                    d[index] = num
                else:
                    d[index]+=num
        print('The length of {:^40} is {:^10} and the EDTA propotation:'.format(name,total))
        for i in dict(sorted(d.items(),key = lambda x:x[0])):
            print('{}\t{}\t{:.2%}'.format(i,d[i],d[i]/total))
