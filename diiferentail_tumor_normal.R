##Loading Data
cluster_mirna_tumor_rpm <- read.csv("read_count.csv",header=FALSE, row.names=1)
library("DESeq")
countsTable <- cluster_mirna_tumor_read_count
rownames(countsTable) <- countsTable$gene
countsTable[,-1]

##head( countsTable)

conds <-  factor(c("Tumor","Tumor","Tumor","Tumor","Tumor","Normal","Normal","Normal","Normal","Normal"))
cds = newCountDataSet( countsTable, conds )

cds = estimateSizeFactors( cds )

sizeFactors( cds )
counts( cds, normalized=TRUE ) 
cds = estimateDispersions( cds )
cds = estimateDispersions( cds,method="pooled",fitType="local" )
plotDispEsts( cds )
de_cluster_res = nbinomTest( cds, "Tumor", "Normal" )
