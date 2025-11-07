library(tidyverse)
library(dplyr)
library(matrixStats)
library(ggplot2)
library(broom)


data_readin <- read.table("read_matrix.tsv")
head(data_readin)
data_matrix <- as.matrix(data_readin)
valid_genes <- data_matrix[complete.cases(data_matrix), ]

gene_sds <- rowSds(valid_genes)
top_genes <- order(gene_sds, decreasing = TRUE)[1:500]
top_gene_matrix <- data_matrix[top_genes, ]

pca_results <- prcomp(t(top_gene_matrix)) 
pca_summary <- tibble (PCA1 = pca_results$x[,1], PCA2 = pca_results$x[,2], 
                       RowNames = rownames(pca_results$x)) %>%
                  tidyr::separate(RowNames, c("tissue","replicate"), sep="_")

#plot PCA 
pca_summary %>%
  ggplot( aes( PCA1, PCA2, color= tissue, shape=replicate ) ) +
  geom_point(size=3)


#scree 
scree_tibble <- tibble(
  PC = 1:length(pca_results$sdev),
  sd=pca_results$sdev,
  var = (pca_results$sdev)^2 / sum((pca_results$sdev)^2))
                
ggplot(scree_tibble, aes(x = PC, y = var)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Scree Plot",
    x = "PC",
    y = "Variance Explained"
    )


#kmeans clustering 

combined <- data_matrix[, seq(1, 21, 3)]
combined <- combined + data_matrix[, seq(2, 21, 3)]
combined <- combined + data_matrix[, seq(3, 21, 3)]
combined <- combined / 3

row_sd <- rowSds(combined)
filtered_genes <- combined[gene_sds > 1, ]

set.seed(42)
kmeans_results <- kmeans(filtered_genes, centers=12, nstart=100)
labels <- kmeans_results$cluster
ordering <- order(labels)
sorted_data <- filtered_genes[ordering, ]

heatmap(sorted_data, 
        Rowv=NA, Colv=NA, 
        RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[labels], 
        ylab="Gene")

#GO Analysis
cluster3 <- rownames(filtered_genes)[labels == 3]
cluster6 <- rownames(filtered_genes)[labels == 6]

