library(tidyverse)

allele_freq <- read.csv("~/qb25-answers/week3/AF.txt", header = FALSE)

ggplot(allele_freq, aes(x = V1)) +
  geom_histogram(bins = 11) + 
  labs(
    x = "Allele frequency",
    y = "Number of occurances"
  )

