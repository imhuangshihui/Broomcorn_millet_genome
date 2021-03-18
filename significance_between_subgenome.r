# 第一组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai1&4.txt",
                       sep = "\t",
                       header = T)
var.test(a$Chr01,a$Chr04)  # 检测两样本的方差是否相等
t.test(a$Chr01,a$Chr04)    # 分析平均值差异显著性（两样本异方差），α = 0.05
t.test(a$Chr01,a$Chr04,conf.level = 0.99)  # α = 0.01

# 第二组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai2&11.txt",
                sep = "\t",
                header = T)
var.test(a$Chr02,a$Chr11)  # 检测两样本的方差是否相等
t.test(a$Chr02,a$Chr11,var.equal=T)    # 分析平均值差异显著性（两样本等方差），α = 0.05
t.test(a$Chr02,a$Chr11,conf.level = 0.99,var.equal=T)  # α = 0.01

# 第三组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai3&10.txt",
                sep = "\t",
                header = T)
var.test(a$Chr03,a$Chr10)
t.test(a$Chr03,a$Chr10,var.equal=T)    # 分析平均值差异显著性（两样本等方差），α = 0.05
t.test(a$Chr03,a$Chr10,conf.level = 0.99,var.equal=T)  # α = 0.01

# 第四组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai5&8.txt",
                sep = "\t",
                header = T)
var.test(a$Chr05,a$Chr08)
t.test(a$Chr05,a$Chr08)    # 分析平均值差异显著性（两样本异方差），α = 0.05
t.test(a$Chr05,a$Chr08,conf.level = 0.99)  # α = 0.01

# 第五组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai6&12.txt",
                sep = "\t",
                header = T)
var.test(a$Chr06,a$Chr12)
t.test(a$Chr06,a$Chr12,var.equal=T)    # 分析平均值差异显著性（两样本等方差），α = 0.05
t.test(a$Chr06,a$Chr12,conf.level = 0.99,var.equal=T)  # α = 0.01

# 第六组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai7&16.txt",
                sep = "\t",
                header = T)
var.test(a$Chr07,a$Chr16)
t.test(a$Chr07,a$Chr16)    # 分析平均值差异显著性（两样本异方差），α = 0.05
t.test(a$Chr07,a$Chr16,conf.level = 0.99)  # α = 0.01

# 第七组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai9&18.txt",
                sep = "\t",
                header = T)
var.test(a$Chr09,a$Chr18)
t.test(a$Chr09,a$Chr18,var.equal=T)    # 分析平均值差异显著性（两样本等方差），α = 0.05
t.test(a$Chr09,a$Chr18,conf.level = 0.99,var.equal=T)  # α = 0.01

# 第八组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai13&17.txt",
                sep = "\t",
                header = T)
var.test(a$Chr13,a$Chr17)
t.test(a$Chr13,a$Chr17,var.equal=T)    # 分析平均值差异显著性（两样本等方差），α = 0.05
t.test(a$Chr13,a$Chr17,conf.level = 0.99,var.equal=T)  # α = 0.01

# 第九组染色体
a <- read.table(file = "C:\\Users\\SHANG Yitong\\Downloads\\Compressed\\r_lai\\lai14&15.txt",
                sep = "\t",
                header = T)
var.test(a$Chr14,a$Chr15)
t.test(a$Chr14,a$Chr15)    # 分析平均值差异显著性（两样本异方差），α = 0.05
t.test(a$Chr14,a$Chr15,conf.level = 0.99)  # α = 0.01
