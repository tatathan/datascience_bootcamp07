specphone_url <- "https://specphone.com/Samsung-Galaxy-S23-5G.html"

topic<-specphone_url %>%
  read_html() %>%
  html_elements("div.topic") %>%
  html_text2()

detail<-specphone_url %>%
  read_html() %>%
  html_elements("div.detail") %>%
  html_text2()

df <- data.frame(topic, detail)
View(df)
