# Other types of R plot which can be used to presented the relationship between ka and ks
# Loading R package
rm(list=ls())
library(ggplot2)
library(reshape2)

# Set working path and load the data
setwd("/Users/Davey/Desktop")
data <- read.table("test_ks.txt",header = T,sep="\t")
data <- melt(data,variable.name="Species",value.name =  "Ks")
# Delete rows with NA
data = na.omit(data)
head(data)
##             Species     Ks
## 1 SpeciesA_SpeciesB 0.0915
## 2 SpeciesA_SpeciesB 0.2535
## 3 SpeciesA_SpeciesB 0.0386
## 4 SpeciesA_SpeciesB 0.1385
## 5 SpeciesA_SpeciesB 0.1125
## 6 SpeciesA_SpeciesB 0.1960

p1 <- ggplot(data,aes(Ks,fill=Species,color=Species,alpha=0.8))  +`
geom_density()  + xlim(0,1)  + theme_classic()  + geom_rug()  +
guides(alpha=FALSE)  +
theme(axis.title = element_text(size=16),axis.text=element_text(size=16),legend.position =  "top")
p1
#ggsave("Ks_plot.png",p1)
ggsave("Ks_plot.pdf",p1)

p2 <- ggplot(data,aes(Ks,color=Species))  +
geom_line(stat="density")  + xlim(0,1)  + theme_bw()  +
theme(axis.title = element_text(size=16),axis.text=element_text(size=16))
p2

p3 <- ggplot(data,aes(Ks,fill=Species,color=Species))  +
geom_histogram(bins=100)  + geom_rug()  +
xlim(0,1)  + theme_bw()  +
theme(axis.title = element_text(size=16),axis.text=element_text(size=16))
p3
