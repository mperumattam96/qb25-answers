library (tidyverse)
library(broom)
install.packages("paletteer")
library(paletteer)

dnm <- read.csv("~/qb25-answers/week5/aau1043_dnm.csv")
parental_age <- read.csv("~/qb25-answers/week5/aau1043_parental_age.csv")

dnm_tibble <- as_tibble(dnm)
parental_age_tibble <- as_tibble(parental_age)

#per-proband summary with counts of maternally and paternally 
#inherited DNMs.

count <- dnm_tibble %>%
  group_by(Proband_id) %>%
  summarise(
    DNM_count_father = sum(Phase_combined == "father", na.rm = TRUE),
    DNM_count_mother = sum(Phase_combined == "mother", na.rm = TRUE)
  )
count
  
joined_df <- count %>%
  left_join(parental_age_tibble, by = "Proband_id")

#1) Create a scatter plot of the count of maternal DNMs vs. maternal age 
# → save as ex2_a.png

ggplot(joined_df, aes(x = Mother_age  , y = DNM_count_mother )) +
         geom_point() +
          labs(
           x = "Maternal Age",
           y = "Maternal DNM count",
         ) 

ggplot(joined_df, aes(x = Father_age  , y = DNM_count_father )) +
  geom_point() +
  labs(
    x = "Paternal Age",
    y = "Paternal DNM count",
  ) 

mother_model <- lm (data = joined_df, DNM_count_mother ~ Mother_age) %>%
  summary()
mother_model

father_model <- lm (data = joined_df, DNM_count_father ~ Father_age ) %>%
  summary()
father_model

father_model <- lm (data = joined_df, DNM_count_father ~ Father_age )
new_father_age <- tibble(Father_age = 50.5) 
father_predict <- predict(father_model, newdata = new_father_age)
print(father_predict)

#need to make a new tibble with column specifiying either mother or father 
# pivot_longer()
df_parent <- joined_df %>%
  pivot_longer(
    cols = c(DNM_count_father, DNM_count_mother),
    names_to = "Parent",
    values_to = "DNMs"
  )

ggplot(df_parent, aes(x = Mother_age, y = DNMs, color = Parent)) +
  geom_point(alpha = 0.6, size = 2) +
  scale_x_log10() + 
  scale_y_log10() +
  labs(
    x = "Age",
    y = "DNMs",
  ) +
  scale_color_paletteer_d("LaCroixColoR::Mango", name = "Parent") +
  theme_minimal()