library(rvest)
library(tidyverse)

url <- "https://www.imdb.com/search/title/?groups=top_100&sort=user_rating,desc"

movie_name <- url %>%
  read_html() %>%
  html_elements("h3.lister-item-header") %>%
  html_text2()

ratings <- url %>%
  read_html() %>%
  html_elements("div.ratings-imdb-rating") %>%
  html_text2() %>%
  as.numeric()

run_time <- url %>%
  read_html() %>%
  html_elements("span.runtime") %>%
  html_text2()

df <- data.frame(movie_name, ratings, run_time)
View(df)
