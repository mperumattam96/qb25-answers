library(tidyverse)
install.packages("ggsci")
library(ggsci)

gt <- read.csv("~/qb25-answers/week3/gt_long.txt", header = TRUE, sep = "\t")

#chrII <- gt %>%
  #filter(SampleID == "A01_62", Chrom == "chrII") %>%
  #mutate(Genotype = factor(Genotype))

#A01_62 <- gt %>%
  #filter(SampleID == "A01_62") %>%
  #mutate(Genotype = factor(Genotype))

gt$Genotype <- factor(gt$Genotype)

ggplot(gt, aes(x = Pos, y = SampleID, color = Genotype)) +
  geom_point(size = 2) + 
  scale_color_manual(values = c("blue", "red")) +
  facet_grid(. ~ Chrom, scales = "free_x", space = "free_x") +
  labs(
    x = "Position",
    y = "Sample ID"
  )

#3.2 