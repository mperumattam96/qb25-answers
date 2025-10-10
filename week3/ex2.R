library(tidyverse)

allele_freq <- read.csv("~/qb25-answers/week3/AF.txt")
read_depth <- read.csv("~/qb25-answers/week3/DP.txt")

ggplot(allele_freq, aes(x = AlleleFrequency)) +
  geom_histogram(bins = 11) + 
  labs(
    x = "Allele frequency",
    y = "Number of occurances"
  )

ggplot(read_depth, aes(x = ReadDepth)) +
  geom_histogram(bins = 21) +
  xlim(0,20)
  labs (
    x = "Read depth",
    y = "Number"
  )


##2.1 
# It looks roughly like a binomial distribution. This means that most 
# frequencies are in the intermediate range, which makes sense
# because the alleles are randomly segregated into the offspring, It is unlikely that
# all the offspring carry same allele (allele freq=1). 
  
#2.2
# This graph shows the read depth among all of the samples of all of the 
# variants. Most of the samples had a read depth of under 10. There are a few that
# have higher coverage from sequencing. This is not surprising to see becuase of 
# how samples are usually sequenced- there will be variability in areas of the genome. 
# Right skewed distribution. 
