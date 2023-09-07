#predicts mpg from mtcars by linear regression/decision tree/random forest

from sklearn.linear_model import LinearRegression
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
import pandas as pd

mtcars = pd.read_csv("https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv")
#mtcars.head()

#prepare
X= mtcars[["hp", "wt", "am"]]
y=mtcars["mpg"]

#split data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42) #set.seed(42)

#train model
#LinearRegression
model_lm = LinearRegression()
model_lm.fit(X_train, y_train)
#DecisionTree
model_tree = DecisionTreeRegressor()
model_tree.fit(X_train, y_train)
#RandomForest
model_rf = RandomForestRegressor()
model_rf.fit(X_train, y_train)

#test model
pred_lm = model_lm.predict(X_test)
pred_tree = model_tree.predict(X_test)
pred_rf = model_rf.predict(X_test)

#evaluate
import sklearn.metrics as metrics
from math import sqrt

  
metric = {'MAE':[0,0,0], 'MSE':[0,0,0], 'RMSE':[0,0,0], 'R':[0,0,0]}  
eva = pd.DataFrame(metric, index =['Linear', 'DecisionTree', 'RandomForest'])  

#MAE
eva["MAE"]["Linear"] = metrics.mean_absolute_error(y_test, pred_lm)
eva["MAE"]["DecisionTree"] = metrics.mean_absolute_error(y_test, pred_tree)
eva["MAE"]["RandomForest"] = metrics.mean_absolute_error(y_test, pred_rf)
#MSE
eva["MSE"]["Linear"] = metrics.mean_squared_error(y_test, pred_lm)
eva["MSE"]["DecisionTree"] = metrics.mean_squared_error(y_test, pred_tree)
eva["MSE"]["RandomForest"] = metrics.mean_squared_error(y_test, pred_rf)
#RMSE
eva["RMSE"]["Linear"] = sqrt(metrics.mean_squared_error(y_test, pred_lm))
eva["RMSE"]["DecisionTree"] = sqrt(metrics.mean_squared_error(y_test, pred_tree))
eva["RMSE"]["RandomForest"] = sqrt(metrics.mean_squared_error(y_test, pred_rf))
#R squre
eva["R"]["Linear"] = metrics.r2_score(y_test, pred_lm)
eva["R"]["DecisionTree"] = metrics.r2_score(y_test, pred_tree)
eva["R"]["RandomForest"] = metrics.r2_score(y_test, pred_rf)

print(eva)
