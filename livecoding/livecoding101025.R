library (tidyverse)
library(palmerpenguins)
library(broom) #puts output of linear model to dataframe

head(penguins)

# if there is a difference in flipper length across islands 

ggplot(data = penguins,
       aes (x = island, y = flipper_length_mm)
       )+
  geom_boxplot() #x variable is categorial, y varaible is numeric


lm (data = penguins, formula = flipper_length_mm ~ 1 + island )%>% #lm takes dataframe as input, lm produces fitted model object, summary gives you details about model fit 
  summary()

# with categorical variables, chooses something that is reference which is default, that does pairwise comparisons against
# biscoe is reference level 
#estimates are the average differnce compared to average of biscoe
#biscoe is larger thats why estimates are negative 
# we don't know if there is a difference between dream and island (only does pairways)

m1 <- lm(data = penguins, formula = flipper_length_mm ~ 1 + island ) #store in m1 object?
m0 <- lm(data = penguins, formula = flipper_length_mm ~ 1)
anova(m0, m1) #does my model explain the model more than a simple model 

m2 <- lm(data = penguins, formula = flipper_length_mm ~ 1 + species) #add species as a predictor
summary(m2)
m3 <- lm(data = penguins, formula = flipper_length_mm ~ 1 + island + species) #add species as a predictor
summary(m3)
#adelie is being chosen as reference level of species
#the p values for island are not significant, but species are 
anova(m2, m3) #after counting just species is there difference in flipper length between islands 

# is body mass different between sexes 

ggplot(data = penguins,
        aes (x = sex, y = body_mass_g)) +
    geom_boxplot()

lm (data = penguins, formula = body_mass_g ~ 1 + sex) %>%
  summary()
# males are an average of 683.41 grams heavier 
# this is a t-test: single binary predictive variable

model <- lm (data = penguins, formula = body_mass_g ~ 1 + sex + species + year + island) %>%
  summary()
#on average penuings are getting 3.5 bigger per year, but thats not significantly different 

# what is the body mass of a female Gentoo penguin on the island of Dream in year 2007 (learning how to make a prediction) 4707.93 grams 

#body_mass_g ~ 1 + sex + species + year + island # all of these are xs that need to be multipled by a beta 
body_mass_g ~ beta_0 + beta_1 * sex + beta_2 * species + beta_3 * year + beta_4 * island
    -3746.731 +  0 +            +1374.607        + 3.547 * 2000 + -13.946 #copy and paste this to console 
    

new_obs <- tibble(sex = "female", island = "Dream", year = 2000, species = "Gentoo")

predict(model, newdata = new_obs)
