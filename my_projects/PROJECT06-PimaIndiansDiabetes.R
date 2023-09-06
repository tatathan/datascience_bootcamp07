## classification problem
data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

# library(forcats)
df$diabetes <- fct_relevel(df$diabetes, "pos")

# 1. split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

# 2. train model
set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

#ROC
# ctrl <- trainControl(method = "cv",
#                      number = 5,
#                      summaryFunction = twoClassSummary,
#                      classProbs  = TRUE)


(knn_model <- train(diabetes ~ .,
                    data = train_data,
                    method = "knn",
                    preProcess = c("center", "scale"),
                    metric = "Accuracy", # PR AUC 
                    trControl = ctrl))

# 3. score
p_knn <- predict(knn_model, newdata = test_data)

# 4. evaluate

confusionMatrix(p_knn, test_data$diabetes, 
                positive="pos",
                mode = "prec_recall")

#table(test_data$diabetes, p, dnn= c("Actual","Prediction"))


# -------------------------------------------------
## Logistic Regression

set.seed(42)

ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

(logist_model <- train(diabetes ~ .,
                      data = train_data,
                      method = "glm",
                      metric = "Accuracy", 
                      trControl = ctrl))

# -------------------------------------------------
## Decision Tree (rpart) 
library(rpart)

(tree_model <- train(diabetes ~ .,
                     data = train_data,
                     method = "rpart",
                     metric = "Accuracy", 
                     trControl = ctrl))

library(rpart.plot)
rpart.plot(tree_model$finalModel)

# -------------------------------------------------
## Random Forest 
## Model accuracy the higest >= 76%

## mtry = number of features used to train model
## bootstrap sampling

## bagging technique
mtry_grid <- data.frame(mtry = 2:8)

(rf_model <- train(diabetes ~ .,
                   data = train_data,
                   method = "rf",
                   metric = "Accuracy", 
                   tuneGrid = mtry_grid,
                   trControl = ctrl))


## ----------------------------------------------
## compare models 

list_models <- list(knn = knn_model,
                    logistic = logist_model,
                    decisionTree = tree_model,
                    randomForest = rf_model)

result <- resamples(list_models)

summary(result)


modelCor(result)


## --------------------------------------------
## ridge vs. lasso regression
library(glmnet)

# 0=Ridge, 1=Lasso
glmnet_grid <- expand.grid(alpha = 0:1,
                           lambda = c(0.1, 0.2, 0.3))

(glmnet_model <- train(diabetes ~ .,
                       data = train_data,
                       method = "glmnet",
                       metric = "Accuracy", 
                       tuneLength = 10,
                       trControl = ctrl))
## ----------------------------------------------
## compare models 

list_models <- list(knn = knn_model,
                    logistic = logist_model,
                    decisionTree = tree_model,
                    randomForest = rf_model,
                    ridgeANDlasso = glmnet_model)

result <- resamples(list_models)

summary(result)


modelCor(result)

# 3. score
p_glmnet <- predict(glmnet_model, newdata = test_data)

# 4. evaluate

confusionMatrix(p_glmnet, test_data$diabetes, 
                positive="pos",
                mode = "prec_recall")
