library(tidyverse)

header <- c( "chr", "start", "end", "count" )
df_kc <- read_tsv("~/qb25-answers/week1/hg19-kc-count.bed", col_names=header)

df_kc %>% 
  ggplot(aes(x = start, y= count)) +
    geom_line() +
    facet_wrap(~chr, scales = "free") +
    labs(
      x = "Location (start)",
      y = "Frequency (count)",
      title = "hg19"
  ) 

ggsave("exercise1.png", width = 20, height = 12)

