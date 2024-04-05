# Load necessary libraries
library(tibble)
library(ggplot2)
library(dplyr)

# Simulate data
set.seed(438) # For reproducibility

# Defining the data parameters
years <- 2004:2023
hospital_names <- c('Hospital A', 'Hospital B', 'Hospital C', 'Hospital D', 'Hospital E')
number_of_years <- length(years)
number_of_hospitals <- length(hospital_names)

# Simulate cancer deaths for each hospital across the specified years
cancer_deaths_data <- expand.grid(Year = years, Hospital = hospital_names) %>%
  mutate(Cancer_Deaths = sample(100:200, size = number_of_years * number_of_hospitals, replace = TRUE),
         Year = as.numeric(Year))
cancer_deaths_data$Cancer_Deaths <- as.numeric(cancer_deaths_data$Cancer_Deaths)

# Ten Tests
print(cancer_deaths_data$Hospital |> class() == "factor")
print(cancer_deaths_data$Year |> class() == "numeric") 
print(cancer_deaths_data$Cancer_Deaths |> class() == "numeric")
print(cancer_deaths_data$Year |> min() == 2004)
print(cancer_deaths_data$Year |> max() == 2023)
print(length(unique(cancer_deaths_data$Hospital)) == 5) 
print(any(is.na(cancer_deaths_data)) == FALSE)
print(all(cancer_deaths_data$Cancer_Deaths >= 0))
print(any(cancer_deaths_data$Cancer_Deaths > 1000) == FALSE)
print(all(table(cancer_deaths_data$Hospital) == length(years)))





