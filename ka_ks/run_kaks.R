library(ggplot2)
library(reshape2)
library(tidyverse)

data <- read.table("C:\\Users\\SHANG Yitong\\Desktop\\kaks_filter_r_input.txt", sep = "\t", header = T)
#a <- melt(a,variable.name="Species",value.name =  "Ks")

p1 <- ggplot(data,aes(Ks,fill=Species,color=Species,alpha=0.8))  + geom_density()  + xlim(0,2)  + theme_classic()  + geom_rug()  +
  guides(alpha=FALSE)  +
  theme(axis.title = element_text(size=16),axis.text=element_text(size=16),legend.position =  "right") +
  labs(x = "Ka/Ks", y = "density")
p1

p2 <- ggplot(data,aes(Ks,color=Species))  +
  geom_line(stat="density") + xlim(0,2) + theme_bw()  +
  theme(axis.title = element_text(size=16),axis.text=element_text(size=16))
p2