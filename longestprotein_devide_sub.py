## MCScanX

import pandas as pd

# 打开文件
with open('longmi4.prot.fa', 'r') as f:
    d = f.read()
    data = [i for i in d.split('*')] # 打开文件的时候， 以 * 分割 成数组
data.pop()  # 把最后的 []空格？ 删除

dicts = {}  # 创建一个字典


for i in range(len(data)):
    # flag = data[i] # 如果符合条件，那就把原本所有的东西保存， 所以保存一个副本。
    data[i] = data[i].replace("\n", "")  # 将 换行符 替换
    temp = [j for j in data[i].split(' ')]  # 以 ' ' 分割 成数组
    index1 = temp[1].find(':') # 找 index
    index2 = temp[-1].find(':')
    index3 = temp[-1].find(')')

    if temp[1][index1+1:] not in dicts: # 如果不存在，直接保存
        dicts[temp[1][index1+1:]] = [temp[-1][index3+1:], temp[-1][:index2]] # 字典如何保存的？
    else:  # 如果已经存在了， 那比较一下长度
        if len(temp[-1][index3+1:]) > len(dicts[temp[1][index1+1:]][0]): 
            dicts[temp[1][index1+1:]] = [temp[-1][index3+1:], temp[-1][:index2]]
            
            
# 创建两个数组，分别保存两个类别的 数字
arr1 = ['01', '02', '03', '05', '06', '07', '09', '13', '14', ]
arr2 = ['04', '08', '10', '11', '12', '15', '16', '17', '18', ]

# 打开两个文件，用来保存结果
f1 = open("A.prot.fa", "w")
f2 = open("B.prot.fa", "w")


# 遍历字典， 
for i in dicts:
    if dicts[i][1][-2:] in arr1:
        f1.write('>')
        f1.write(i)
        f1.write('\n')
        f1.write(dicts[i][0])
        f1.write('\n')
    elif dicts[i][1][-2:] in arr2:
        f2.write('>')
        f2.write(i)  
        f2.write('\n')
        f2.write(dicts[i][0])
        f2.write('\n')

           
# 关闭文件
f1.close()
f2.close()
