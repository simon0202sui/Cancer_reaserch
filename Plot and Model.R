library(ggplot2)
library(rstanarm)
ggplot(cancer_deaths_data, aes(x = Year, y = Cancer_Deaths, color = Hospital)) +
  geom_line() + 
  labs(title = "Cancer Deaths in Sydney's Largest Hospitals (2004-2023)",
       x = "Year",
       y = "Number of Cancer Deaths") +
  theme_minimal()

# Convert Year to a numeric variable for modeling
cancer_deaths_data$YearNumeric <- as.numeric(as.character(cancer_deaths_data$Year))

# Fit a negative binomial regression model
nb_model <- stan_glm(Cancer_Deaths ~ YearNumeric + as.factor(Hospital),
                     data = cancer_deaths_data,
                     family = neg_binomial_2(link = "log"))

# Summarize the model
print(summary(nb_model))
