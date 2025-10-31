library(tidyverse)
library(dplyr)
library(matrixStats)
library(ggplot2)
library(broom)

#had trouble reading in the data, so I couldn't visualize things
#tried to code based off live coding 

data_readin <- read_tsv("read_matrix.tsv")
#head(data)
data <- as_tibble(data_readin)
data_numeric <- data %>% select(-1)
data_matrix <- as.matrix(data_numeric)
valid_genes <- data_matrix[complete.cases(data_matrix), ]

gene_sds <- rowSds(valid_genes)
top_genes <- order(gene_sds, decreasing = TRUE)[1:500]
top_gene_matrix <- data_matrix[top_genes, ]

pca_results <- prcomp(t(top_gene_matrix)) 
pca_summary <- tibble(PC=seq(1, ncol(top_gene_matrix), 1,
                      sd=pca_results$sdev) %>%
  mutate(norm_var=sd^2)/sum(sd^2),
    cum_var=cumsum(norm_var))

#scree 
pca_summary %>% ggplot(aed(x=PC, y=norm_var)) +
  geom_line()+
  geom_point()

pca_summary %>% ggplot(aes(x=PC, y=cum_var)) +
  geom_line() + geom_point() +
  geom_text(aes(y=cum_var, label=round(cum_var,2)), vjust=-1)

PC_data <- tibble(PC1=pca_results$x[,1],
                  PC2=pca_results$x[,2],
                  sample=colnames(top_gene_matrix))
ggplot(PC_data, aes(PC1, PC2, label=sample)) +
  geom_point(size=3) +
  geom_text(vjust=-1)

#kmeans clustering 

combined <- data_matrix[, seq(1, 21, 3)]
combined <- combined + data_matrix[, seq(2, 21, 3)]
combined <- combined + data_matrix[, seq(3, 21, 3)]
combined <- combined / 3

set.seed(42)
kmeans_results <- kmeans(filtered_data, centers=12, nstart=100)
labels <- kmeans_results$cluster
ordering <- order(labels)
sorted_data <- filtered_data[ordering, ]

heatmap(sorted_data, 
        Rowv=NA, Colv=NA, 
        RowSideColors=RColorBrewer::brewer.pal(12,"Paired")[labels], 
        ylab="Gene")