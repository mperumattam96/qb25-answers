library(tidyverse)
library(broom)
library(ggplot2)
library(paletteer)

coverage <- read_lines("coverage_3x.txt") %>% 
  as.integer() %>% 
  tibble(coverage = .)

genome_size <- nrow(coverage)

hist_df <- coverage %>%
  group_by(coverage) %>%
  summarise(count = n()) 

max_cov <- max(hist_df$coverage)

#Poisson counts
lambda <- 3
poisson_df <- tibble(
  coverage = 0:max_cov,
  count = dpois(0:max_cov, lambda) * genome_size,
  distribution = "Poisson"
)

#Normal counts 

ggplot() +
  geom_col(aes(x = coverage, y = count),
           data = hist_df) +
  geom_line(aes(x = coverage, y = count, color = distribution),
            data = ______, size = 1.2) +
  scale_color_paletteer_d("LaCroixColoR::Mango") +
  labs(
    x = "Coverage 3x",
    y = "Number of Positions",
    color = "Distribution"
  ) +
  theme_minimal()

ggsave("ex1_3x_cov.png", width = 8, height = 6, dpi = 300)

#10x 
#30x 