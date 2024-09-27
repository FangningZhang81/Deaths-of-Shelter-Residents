#### Preamble ####
# Purpose: Simulates data
# Author: Fangning Zhang
# Date: 23 September 2024
# Contact: fangning.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Any other information needed? none

install.packages("readr")  #安装 readr 包
install.packages("tidyverse")

#### Workspace setup ####
library(tidyverse)
library(readr)


#### Simulate data ####

# set seed
set.seed(304)

# Define the parameters of the simulation data
years1 <- 2010:2020  # 年份范围
months1 <- month.abb  # 月份缩写

# The size of the simulated dataset
n <- length(years1) * length(months1)

# Generate simulated data
simulated_data <- tibble(
  Year = rep(years1, each = length(months1)),
  Month = rep(months1, times = length(years1)),
  Total_deaths = rpois(n, lambda = 4),  # 总死亡人数，泊松分布，平均4人
  Transgender = rbinom(n, size = Total_deaths, prob = 0.05),  # 跨性别人数，按5%概率生成
  remaining_deaths = Total_deaths - Transgender,  # 剩余死亡人数
  Male = rbinom(n, size = remaining_deaths, prob = 0.6),  # 男性死亡人数
  Female = remaining_deaths - Male  # 女性死亡人数
  )


# save as CSV
write_csv(simulated_data, file = "data1/simulated_shelter_deaths.csv")


