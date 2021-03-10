import pandas as pd  #安装pandas并命名为pd，用于将数据存入excel
with open('zou.fna.mod.EDTA.intact.gff3', 'r') as f1:  #读入文件
    list1 = f1.readlines()

Line = []  #存储第一个结果的变量，即带有“LTR_retrotransposon”的行
ltr_identity = []  #存储第二个结果的变量，即提取出来的ltr_identity数值

for line in list1:  #for循环，把list1里的内容按行读取
    if "LTR_retrotransposon" in line:  #如果第一行里有关键字则读取，否则跳过到下一行
        Line.append(line.split('\t'))  #将结果读入（append）Line变量，并用Tab分割
        index = line.find('ltr_identity=')  #index表示下标
        ltr_identity.append(line[index+13:index+19])  #下标后的第13到第19个字符之间即为我们要的结果

df = pd.DataFrame(data = Line)  #调用pandas建立表格中的第一个结果，被分为几列
df['ltr_identity'] = ltr_identity  #建立表格中的第二个结果
df.to_csv("result.csv")   #将结果存成csv格式
