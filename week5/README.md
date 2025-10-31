Week 5
1. What is the “size” (i.e., slope) of this relationship? Interpret the slope in plain language. Does it match your plot? 
Mother: 0.37757 
The slope matches my plot. This means that for every year, there will be a 0.38 increase in maternal DNMs 

2. Is the relationship significant? How do you know? Explain the p-value in plain but precise language.
p-value: 2e-16 
The relationship is significant becuase the p value is extremely low. That means that it is very  unilikely that this relationship observed occurred due to random chance. 

2.4 Use the paternal regression model to predict the expected number of paternal DNMs for a father of age 50.5. 
78.69546 

2.6 What is the “size” of this relationship (i.e., the average difference in counts of maternal and paternal DNMs)? Interpret the difference in plain language. Does it match your plot? 2. Is the relationship significant? How do you know? Explain the p-value in plain but precise language.

Size of the relationship is 39.2, which means that on average, there are 39.2 more DNMs contributed by the father than the mother per child. This matches my plot, as the spread of paternal DNMs is higher than the mother. 

The relationship is significant becuase the p value is extremely low (2.2e-16). That means that it is very  unilikely that this relationship observed occurred due to random chance. 

Fit this model using lm() and compare to the results of the paired t-test. How would you interpret the coefficient estimate for the intercept term?

The coefficent estimate from the lm is 39.2, the same as we saw previously. This is the average difference between paternal and maternal DNMs (fathers contribute more). The error is 0.6368, and it is statistically significant as well p-value (<2e-16). 

Exercise 3: Allrecipes dataset
I wanted to look at the recipes that are quick (less than an hour to prepare) so I filtered it by rating > 3.0, and total time < 60, and ploted it in a histogram. I am looking at how the ratings are distributed, and they tend to cluster around a rating of 4.6, meaning that most "short" recipes are highly distributed. 

Does total cooking time predict rating? 
According to my lm, the slope is 4.670e-06. The rating barely increaeses with cooking time, and it is is not statistically significant (0.239). 
