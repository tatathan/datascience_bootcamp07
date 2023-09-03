
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


## -----------------------------------------
## lm, knn

df <- as_tibble(df)

# 1. split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n) #id=?????Ţ1-n ?ӹǹ80%?ͧn
train_data <- df[id, ] #id????Ţrow
test_data <- df[-id, ]

# 2. train model
# medv = f(crim, rm, age)
lm_model <- train(medv ~ crim + rm + age,
                  data = train_data,
                  method = "lm",
                  preProcess = c("center", "scale"))

lm_model$finalModel

set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

# grid search tune hyperparameters
k_grid <- data.frame(k = c(3,5,7,9,11))

knn_model <- train(medv ~ crim + rm + age,
                   data = train_data,
                   method = "knn",
                   metric = "Rsquared",
                   tuneGrid = k_grid,
                   preProcess = c("center", "scale"),
                   trControl = ctrl)
                  #K=3,5,7,9,11 เลือก K=9

# tuneLength random search
(knn_model <- train(medv ~ crim + rm + age,
                    data = train_data,
                    method = "knn",
                    metric = "Rsquared", 
                    tuneLength = 4,
                    preProcess = c("center", "scale"),
                    trControl = ctrl))
                    #K=5,7,9,11 เลือก K=9, Rsqrt=0.6483, RMSE=5.2447

# 3. score
p_knn <- predict(knn_model, newdata=test_data)
p_lm <- predict(lm_model, newdata=test_data)

# 4. evaluate
RMSE(p_knn, test_data$medv)
#5.4836*********
RMSE(p_lm, test_data$medv)
#6.2890
