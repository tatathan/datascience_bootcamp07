from gazpacho import Soup
from requests import get
import pandas as pd

url ="https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

headers = {"Accept-Language": "en-US"}
response = get(url, headers=headers)
imdb = Soup(response.text)

title_list = imdb.find("h3", {"class":"lister-item-header"})
titles = [title.strip() for title in title_list]
#print(titles)

runtimes = imdb.find("span",{"class": "runtime"})
runtimes = [time.strip() for time in runtimes]
#print(runtimes)

df = pd.DataFrame({
    "title": titles,
    "runtime": runtimes
})
#df.head()

df.to_csv("imdb_data.csv")
