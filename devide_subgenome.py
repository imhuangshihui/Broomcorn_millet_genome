with open('GWHAAEZ00000000.gff', 'r') as f:
    d = f.read()
    data = [i for i in d.split('#')]

A = ['GWHAAEZ00000001', 'GWHAAEZ00000002', 'GWHAAEZ00000003',
     'GWHAAEZ00000005', 'GWHAAEZ00000006', 'GWHAAEZ00000007',
     'GWHAAEZ00000009', 'GWHAAEZ00000013', 'GWHAAEZ00000014']
B = ['GWHAAEZ00000015', 'GWHAAEZ00000016', 'GWHAAEZ00000017',
     'GWHAAEZ00000012', 'GWHAAEZ00000011', 'GWHAAEZ00000010',
     'GWHAAEZ00000004', 'GWHAAEZ00000008', 'GWHAAEZ00000018']

#N = ["CM009690.2", "CM009692.2", "CM009694.2", "CM009696.2", "CM009698.2", "CM009700.2", "CM009702.2", "CM009704.2", "CM009706.2"]
#M = ['CM009691.2','CM009693.2','CM009695.2','CM009697.2','CM009699.2','CM009701.2','CM009703.2','CM009705.2','CM009707.2']

f1 = open("LongmiA.gff", "w")
f2 = open("LongmiB.gff", "w")

for i in data:
    for a in A:
        if a in i:
            f1.write('#')
            f1.write(i)
    for b in B:
        if b in i:
            f2.write('#')
            f2.write(i)

f1.close()
f2.close()
