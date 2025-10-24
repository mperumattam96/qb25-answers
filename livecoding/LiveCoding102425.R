#Live_Coding_102425
library(tidyr)
library(dplyr)
library(palmerpenguins)
library(matrixStats)
library(ggplot2)

#first see if we have missing values

penguins %>% summarize_all(funs(sum(is.na(.))))
      penguins %>%
        select_if(is.numeric) %>%
        drop_na() %>% 
        cor

valid_penguins = penguins[complete.cases(penguins),]
# 'nrow(valid_penguins)': [1] 333 : in console

species = valid_penguins$species #vector with species for plotting
summary(valid_penguins$island)
num_penguins = valid_penguins %>%
  mutate(biscoe=as.numeric(island=="Biscoe")) #new column with 0 or 1
  mutate(torgersen=as.numeric(island=="Torgersen")) 
  mutate(dream=as.numeric(island=="Dream")) 
  mutate(sex=ifelse(sex=="male", 0, 1))%>%
  select_if(is.numeric) #PCA only looks at numerical, not categorical values
  
norm_penguins = scale(num_penguins) # normalizes #subtracts mean and divides by standard deviation 
# in console:  colSds(norm_penguins)

pca_results = prcomp(norm_penguins)
#in console: View(pca_results) 
  # pcs_results$sdev
  # summary (pca_results)

#visuale: create tibble first

pca_data = tibble(PC1=pca_results$x[,1] PC=pca_results$[,2] species=species, sex=valid_penguins$sex) 
pca_summary = tibble (PC=seq(1, ncol(norm_penguins), 1), sd=pca_results$sdev) %>%
  mutate(var=sd^2)
  mutate(norm_var=var/sum(var))

pca_summary %>% ggplot(aes(PC, norm_var)) +
  geome_line()+
  geom_point()


library( "tidyverse" )
library( "palmerpenguins" )

valid_penguins <- penguins[complete.cases(penguins),]
species <- valid_penguins$species
num_penguins <- valid_penguins %>%
  mutate(
    biscoe=as.numeric(island=="Biscoe"),
    torgersen=as.numeric(island=="Torgersen"),
    dream=as.numeric(island=="Dream"),
    sex=ifelse(sex=="male", 0, 1)
  ) %>%
  select_if( is.numeric )
norm_penguins <- scale( num_penguins )

pca_results <- prcomp(norm_penguins)

pca_data <- tibble( PC1=pca_results$x[,1], PC2=pca_results$x[,2], species=species )
pca_summary <- tibble( PC=seq(1,ncol(norm_penguins),1), sd=pca_results$sdev) %>%
  mutate(
    var=sd^2,
    norm_var=var/sum(var)
  )
pca_summary %>% 
  ggplot( aes(PC, norm_var) ) +
  geom_line() +
  geom_point()
pca_data %>%
  ggplot( aes( PC1, PC2, color=species, shape=sex ) ) +
  geom_point()

#pc1 sepearating gentoo, pc2 is sex 
#if we look at the loading pc2 is going to be body size and flipper size 
#pc 1 will be relationship between bill size and flipper size 

heatmap(as.matrix( pca_results$rotation, Rowv=NA, Colv=NA ))

#use kmeans clustering instead of PCA analysis
#ignore categorical variable like island 
kmeans_data <- valid_penguins %>%
  select_if( is.numeric ) %>%
  select( -year )

kmeans_data <- valid_penguins %>%
  select_if( is.numeric ) %>%
  select( -year )
kmeans_results <- kmeans(scale(as.matrix(kmeans_data)), centers=6, nstart=100 )

pca_data <- tibble( PC1=pca_results$x[,1], #we are only looking at PC1 and 2
                    PC2=pca_results$x[,2], 
                    species=species,
                    sex=valid_penguins$sex,
                    cluster=as.factor(kmeans_results$cluster),
                    island=valid_penguins$island
)

pca_data %>% ggplot(aes(PC1, PC2, color=cluster, shape=species)) + 
  geom_point()