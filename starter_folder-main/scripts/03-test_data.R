#### Preamble ####
# Purpose: check of the data
# Author: Fangning Zhang
# Date: 24 September 2024
# Contact: fangning.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Any other information needed? none


#### Workspace setup ####
library(tidyverse)

#### Test data ####
sdata <- read_csv("data1/simulated_shelter_deaths.csv")

#test1
sdata$Total_deaths |> min() < 0

#test2
sdata$Male |> min() < 0

#test3
# total=female+male+trans
# Replace NA values in the Transgender column with 0
transgender_na_replaced <- ifelse(is.na(simulated_data$Transgender), 0, simulated_data$Transgender)

# test total=female+male+trans
(simulated_data$Total_deaths == simulated_data$Male + simulated_data$Female + transgender_na_replaced) |> 
  all()


