library (tidyverse)
library(broom)

dnm <- read.csv("~/qb25-answers/week5/aau1043_dnm.csv")
parental_age <- read.csv("~/qb25-answers/week5/aau1043_parental_age.csv")

dnm_tibble <- as_tibble(dnm)
parental_age_tibble <- as_tibble(parental_age)

#per-proband summary with counts of maternally and paternally 
#inherited DNMs.

dnm_tibble %>%
  summarise(
    DNM_count_father = sum(Phase_combined == "father", na.rm = TRUE),
    DNM_count_mother = sum(Phase_combined == "mother", na.rm = TRUE)
  )
  
joined <- dnm_tibble %>%
  left_join(parental_age_tibble, by = "Proband_id")


lm (data = dnm_tibble, formula = Proband_id ~ 1 + Phase_combined) %>%
  summary()



