#predicts mpg from mtcars by linear regression

from sklearn.linear_model import LinearRegression
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
model = LinearRegression()
model.fit(X_train, y_train)

#test model
pred = model.predict(X_test)

#evaluate
import sklearn.metrics as metrics
from math import sqrt
#MAE
MAE = metrics.mean_absolute_error(y_test, pred)
#MSE
MSE = metrics.mean_squared_error(y_test, pred)
#RMSE
RMSE = sqrt(metrics.mean_squared_error(y_test, pred))
#R squre
R = metrics.r2_score(y_test, pred)
print(f"""MAE = {MAE},
MSE = {MSE},
RMSE = {RMSE},
R = {R}""")
