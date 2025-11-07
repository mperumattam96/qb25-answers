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
bloodcounts_df[1:5,]
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

#Which principal components appear to be associated with which subject-level variables?
# PC1 appears to be associated with cause of death, and PC2 which is less certain, appears to be associated with sex.  

#Exercise 2
vsd_df <- assay(vsd) %>%
  t() %>%
  as_tibble()
vsd_df <- bind_cols(metadata_df, vsd_df)

m1 <- lm(formula = WASH7P ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy()
m1
# The p-value for the estimated sex difference is 2.79e- 1, which is not statistically significant. 
# This means that WASH7P does not show significant evidence of sex-differential expression. 

m2 <- lm(formula =SLC25A47 ~ DTHHRDY + AGE + SEX, data = vsd_df) %>%
  summary() %>%
  tidy() 
m2
# The estimated difference is 0.518 and p value is 2.57e- 2, which means that 
# SLC25A47 does show significant evidence of sex-differential expression, and
# because it is positive, that means males have higher expression of SLC25A47 than females. 

#DESEQ2

dds <- DESeq(dds)

res <- results(dds, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")
head(res)


sum(res$padj < 0.1, na.rm = TRUE)
# 262 genes exhibit significant differential expression between males and females at a 10% FDR
# 10% of these genes will be false positives. 

#merge 
gene_loc <- read_delim("gene_locations.txt")
merge <- left_join(res, gene_loc, by = "GENE_NAME")
ordered <- merge %>% arrange(padj)

#The top hits of genes that are most strongly upregulated in males versus 
#females are all encoded by the Y chromosome! And there are more 
# male-upregulated genes at the top of the lost (postiive log2FoldChange), which 
# makes sense because we are looking at differential expression for the sex variable. 

#WASH7P
ordered %>% filter(GENE_NAME == "WASH7P")
#Not statistically significant
#SLC25A47
ordered %>% filter(GENE_NAME == "SLC25A47")
#Males have higher expression than females, and it is statistically significant.
#Overall yes, the results are broadly consistent with the model in step 2.1 

#Analysis 
#If FDR threshold is 1%, then you will see more false negatives (decrease false positive)
# because you are being more stringent about what genes are differentially expressed, so you might miss some. 
# If FDR threshold is 20% then you will see more false positives (decrease false negative). 
# because you are being more 'generous' with what you call differential expression.
# Larger sample sizes will make our analysis more powerful and allow us to detect
# actually differentially expressed genes. However, if we have a small sample size 
# and a small effect size, we might miss some differential gene expression. 

#Death results
death_res <- results(dds, name = "DTHHRDY_ventilator_case_vs_fast_death_of_natural_causes")  %>%
  as_tibble(rownames = "GENE_NAME")
sum(death_res$padj < 0.1, na.rm = TRUE)
# 16069 differentially expressed genes according to death classification at 10% FDR

#shuffle
metadata_df$SEX <- sample(metadata_df$SEX, replace = FALSE)
colData(dds)$SEX <- metadata_df$SEX
dds <- DESeq(dds) #getting error when running new dds 

shuffle_res <- results(dds, name = "SEX_male_vs_female")  %>%
  as_tibble(rownames = "GENE_NAME")
sum(shuffle_res$padj < 0.1, na.rm = TRUE)

#Volcano Plot
ggplot(data = res, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point()
#not sure how to color plot 