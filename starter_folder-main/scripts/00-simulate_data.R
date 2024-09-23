#### Preamble ####
# Purpose: Simulates data
# Author: Fangning Zhang
# Date: 19 September 2024
# Contact: fangning.zhang@mail.utoronto.ca 
# License: MIT
# Pre-requisites: none
# Any other information needed? none


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####

# 设置随机种子
set.seed(304)

# 定义模拟数据的参数
years1 <- 2010:2020  # 年份范围
months1 <- month.abb  # 月份缩写

# 模拟数据集的大小
n <- length(years1) * length(months1)

# 生成模拟数据
simulated_data <- tibble(
  Year = rep(years1, each = length(months1)),
  Month = rep(months1, times = length(years1)),
  Total_deaths = rpois(n, lambda = 4),  # 总死亡人数，泊松分布，平均3人
  Male = rbinom(n, size = Total_deaths, prob = 0.6),  # 男性死亡人数，按60%概率生成
  Female = Total_deaths - Male,  # 女性死亡人数
  Transgender = sample(c(0, 1, NA), n, replace = TRUE, prob = c(0.95, 0.03, 0.02))  # 跨性别人群，少量随机分布
)


# 保存数据到 CSV 文件
write_csv(simulated_data, file = "data/simulated_shelter_deaths.csv")


