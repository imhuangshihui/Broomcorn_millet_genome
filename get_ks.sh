## 从CoGe得到Ks的输出文件后，通过整理得到数据用matlab-ksdensity画图
cat raw.ks | awk '{if($1!~"^#"){print $1}}' | awk '{print log($1)/log(2)}'|awk '{if ($1 != "0"){print $1}}'| awk '{gsub(/-inf/,"-10");print $1}' > output.ks
# 忽略掉所有井号开头的行，提取第一列的Ks值
awk '{if($1!~"^#"){print $1}}' Longmi4.ks    
# 对第一列取以2为底的对数用log($1)/log(2)
awk '{print log($1)/log(2)}' 
# 如果遇到0则不要计算
awk '{if ($1 != "0"){print $1}}'
# 把所有-inf（不计算0的产物）替换为-10
awk '{gsub(/-inf/,"-10");print $1}'
