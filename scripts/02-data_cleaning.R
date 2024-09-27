#### Preamble ####
# Purpose: Cleans the raw death data into an analysis dataset
# Author: Fangning Zhang
# Date: 23 September 2024
# Contact: fangning.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Any other information needed? none

#### Workspace setup ####
# Load necessary libraries
library(tidyverse)
library(janitor)

#### Clean data ####
# Read the raw data
raw_data <- read_csv("data1/raw_data/raw_data.csv")  |> 
  janitor::clean_names() # Clean column names

# Replace month abbreviations with numeric values using recode()
cleaned_data <- raw_data |>
  mutate(
    month = recode(
      month,
      Jan = "01", Feb = "02", Mar = "03", Apr = "04", May = "05", Jun = "06",
      Jul = "07", Aug = "08", Sep = "09", Oct = "10", Nov = "11", Dec = "12"
    )
  )

# Add a new column with the format "year_month"
cleaned_data <- cleaned_data |>
  mutate(year_month = paste(year, month, sep = "_"))

# Replace NA values in the actual column name with 0
# This will convert any non-numeric values to NA
cleaned_data <- cleaned_data |>
  mutate(transgender_non_binary_two_spirit = as.numeric(transgender_non_binary_two_spirit))

cleaned_data <- cleaned_data |>
  mutate(transgender_non_binary_two_spirit = replace_na(transgender_non_binary_two_spirit, 0))


#### Save data ####
write_csv(cleaned_data, "data1/analysis_data/analysis_data.csv")

