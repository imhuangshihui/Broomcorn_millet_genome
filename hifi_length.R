pdf("~/hifi_reads_length_cc4plot.pdf");
aa = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\barley_length.txt",header=F);
bb = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\frog_length.txt",header=F);
cc = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\human_length.txt",header=F);
dd = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\maize_length.txt",header=F);
ee = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\panicum_length.txt",header=F);
ff = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\rice_length.txt",header=F);
gg = read.table("C:\\Users\\SHANG Yitong\\Desktop\\hifi_length\\mouse_length.txt",header=F);
plot(density(cc[,1]),col="red",type="l",lwd=2,xlim=c(3.5,5));
points(density(aa[,1]),col="black",type="l",lwd=2);
points(density(bb[,1]),col="royalblue",type="l",lwd=2);
points(density(dd[,1]),col="green3",type="l",lwd=2);
points(density(ee[,1]),col="cyan",type="l",lwd=2);
points(density(ff[,1]),col="magenta",type="l",lwd=2);
points(density(gg[,1]),col="gray",type="l",lwd=2);
while (!is.null(dev.list()))  dev.off()
