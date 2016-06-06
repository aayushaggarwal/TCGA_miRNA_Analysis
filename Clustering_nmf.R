##CLustring of read_per_million_count data of miRNA Expression of HCC Patients

##Loading Data
cluster_mirna_tumor_rpm <- read.csv("cluster_mirna_tumor_rpm.csv",
                                    header=FALSE, row.names=1)
##Loading Package NMF
library("NMF")

##Doing clustering with 5 runs from k=2 to 5
estim.r <- nmf(cluster_mirna_tumor_rpm, 2:5,"lee",nrun=5, seed=123456,.Options='t')

opar <- par(mfrow=c(1,2))
cor(w,use='everything',method='kendall')


plot(w[,1],w[,2],main="Scatterplot ",xlab="Metagene 1",ylab="Metagene 2")
res2 <- nmf(cluster_mirna_tumor_rpm, 2,"lee",nrun=5, seed=123456,.options='t')
res3 <- nmf(cluster_mirna_tumor_rpm, 3,"lee",nrun=5, seed=123456,.options='t')
plot(estim.r)
consensusmap(estim.r)
basismap(estim.r)
coefmap(estim.r)
summary(estim.r)
fit(estim.r)
cat(out,file='summary.txt',sep = '\n',append='TRUE')
w <- basis(estim.r)
sil <- silhouette(estim.r)
predict(res2)
plot(estim.r,dispersion)
aheatmap(rpm_tumor2)
layout(cbind(1, 2))
consensusmap(res2)
