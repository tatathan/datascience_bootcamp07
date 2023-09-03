library(tidyverse)
mtcars %>%
  summarize(
    avg_hp = mean(hp),
    med_hp = median(hp),
    sd_hp = sd(hp),
    var_hp = var(hp),
    IQR_hp = IQR(hp),
    n = n()
  )

#boxplot
ggplot(mtcars, aes(hp)) + geom_boxplot()


#DEMO
true_mean<-mean(diamonds$price)
#3932.8

mean_price_diamond<- function() {
  result<- diamonds %>%
    sample_n(100) %>%
    summarise(
      mean_price = mean(price)) %>%
    pull(mean_price)
  return(result)
}

replicate(10, {mean_price_diamond()})  

result<-replicate(1000, {mean_price_diamond()})  
hist(result)
mean(result)
