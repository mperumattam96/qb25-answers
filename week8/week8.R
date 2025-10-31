library(tidyverse)
library(DESeq2)
library(broom)

setwd("~/qb25-answers/week8")
#data
bloodcounts_df <- read_delim("gtex_whole_blood_counts_downsample.txt")
bloodcounts_df <- column_to_rownames(bloodcounts_df, var = "GENE_NAME")

#metadata
metadata_df <- read_delim("gtex_metadata_downsample.txt")
metadata_df[1:10,]
metadata_df <- column_to_rownames(metadata_df, var = "SUBJECT_ID")

#peak at data
counts_df[1:5,]
metadata_df[1:10,]

#check order 
colnames(bloodcounts_df) == rownames(metadata_df) 

#DESeq2 object
dds <- DESeqDataSetFromMatrix(countData = bloodcounts_df, 
                              colData = metadata_df,
                              design = ~ SEX + DTHHRDY + AGE )

#Normalize and plot PCA
vsd <- vst(dds)
plotPCA(vsd, intgroup = "SEX") 
plotPCA(vsd, intgroup = "DTHHRDY")
plotPCA(vsd, intgroup = "AGE") 

#What proportion of variance in the gene expression data is explained by each of the first two principal components? 
# 48% of the variance is explained by the first principle component, and 7% is explained by the second principle component. 

#Which principal components appear to be associated 
# with which subject-level variables?
# PC1 appears to be associated with cause of death, and PC2 which is less certain, appears to be associated with sex.  



