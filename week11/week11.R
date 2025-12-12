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
normal_df <- tibble(
  coverage = 0:max_cov,
  count = dnorm(0:max_cov, mean = lambda, sd = sqrt(lambda)) * genome_size,
  distribution = "Normal"
)
dist_df <- bind_rows(poisson_df, normal_df)

ggplot() +
  geom_col(aes(x = coverage, y = count),
           data = hist_df) +
  geom_line(aes(x = coverage, y = count, color = distribution),
            data = dist_df, size = 1.2) +
  scale_color_paletteer_d("LaCroixColoR::Mango") +
  labs(
    title = "3x Coverage",
    x = "Coverage 3x",
    y = "Number of Positions",
    color = "Distribution"
  ) +
  theme_minimal()

ggsave("ex1_3x_cov.png", width = 8, height = 6, dpi = 300)

#10x 
coverage <- read_lines("coverage_10x.txt") %>% 
  as.integer() %>% 
  tibble(coverage = .)

genome_size <- nrow(coverage)


hist_df <- coverage %>%
  group_by(coverage) %>%
  summarise(count = n()) 

max_cov <- max(hist_df$coverage)


lambda <- 10
poisson_df <- tibble(
  coverage = 0:max_cov,
  count = dpois(0:max_cov, lambda) * genome_size,
  distribution = "Poisson"
)


normal_df <- tibble(
  coverage = 0:max_cov,
  count = dnorm(0:max_cov, mean = lambda, sd = sqrt(lambda)) * genome_size,
  distribution = "Normal"
)


dist_df <- bind_rows(poisson_df, normal_df)


ggplot() +
  geom_col(aes(x = coverage, y = count),
           data = hist_df,) +
  geom_line(aes(x = coverage, y = count, color = distribution),
            data = dist_df, size = 1.2) +
  scale_color_paletteer_d("LaCroixColoR::Mango") +
  labs(
    title = "10x Coverage",
    x = "Coverage 10x",
    y = "Number of Positions",
    color = "Distribution"
  ) +
  theme_minimal()

ggsave("ex1_10x_cov.png", width = 8, height = 6, dpi = 300)

#30x 

coverage <- read_lines("coverage_30x.txt") %>% 
  as.integer() %>% 
  tibble(coverage = .)

genome_size <- nrow(coverage)


hist_df <- coverage %>%
  group_by(coverage) %>%
  summarise(count = n()) 

max_cov <- max(hist_df$coverage)

lambda <- 30
poisson_df <- tibble(
  coverage = 0:max_cov,
  count = dpois(0:max_cov, lambda) * genome_size,
  distribution = "Poisson"
)


normal_df <- tibble(
  coverage = 0:max_cov,
  count = dnorm(0:max_cov, mean = lambda, sd = sqrt(lambda)) * genome_size,
  distribution = "Normal"
)


dist_df <- bind_rows(poisson_df, normal_df)



ggplot() +
  geom_col(aes(x = coverage, y = count),
           data = hist_df) +
  geom_line(aes(x = coverage, y = count, color = distribution),
            data = dist_df, size = 1.2) +
  scale_color_paletteer_d("LaCroixColoR::Mango") +
  labs(
    title = "30x Coverage",
    x = "Coverage 30x",
    y = "Number of Positions",
    color = "Distribution"
  ) +
  theme_minimal()


ggsave("ex1_30x_cov.png", width = 8, height = 6, dpi = 300)
