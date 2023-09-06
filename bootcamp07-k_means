
## load library
library(caret)
library(tidyverse)
library(mlbench)
library(MLmetrics)

## see available data
data()
data("BostonHousing")

## glimpse data
df <- BostonHousing
glimpse(df)

## clustering => segmentation

subset_df <- df %>%
  select(crim, rm, age, lstat, medv) %>%
  as_tibble()

## test different k (k= 2-5)
result <- kmeans(x = subset_df, centers = 3)

## membership [1,2,3]
subset_df$cluster <- result$cluster

##
subset_df %>%
  group_by(cluster) %>%
  summarise(avg_med = mean(medv))

result$centers

View(subset_df) 
