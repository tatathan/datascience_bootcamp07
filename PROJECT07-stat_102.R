Z_cal<- function(x) {
  (x-mean(x)) / sd(x)
}

Z_cal(c(1,2,3,4,5))
Z_cal(mtcars$hp)

#normalization
norm_cal <- function(x) {
  (x-min(x)) / (max(x) - min(x))
}

norm_cal(1:5)


#confidence interval for hp
mean(mtcars$hp); sd(mtcars$hp) #sd()ในR เป็นสูตรของpop 

#สร้างsd for sample
sd_sample<- function(x){
  sqrt((sum((x-mean(x))^2)) / (length(x)-1))
}

#สร้างsd for pop
sd_pop<- function(x){
  sqrt((sum((x-mean(x))^2)) / length(x))
}

sd_sample(mtcars$hp)
sd_pop(mtcars$hp)

# t.test(mtcars$hp)
# data:  mtcars$hp
# t = 12.103, df = 31, p-value = 2.794e-13
# alternative hypothesis: true mean is not equal to 0
# 95 percent confidence interval:
#   121.9679 171.4071
# sample estimates:
#   mean of x 
# 146.6875 


##Create promoA VS promoB
promoA <- rnorm( 100, mean = 550, sd=10)
promoB <- rnorm( 100, mean = 400, sd=8)

##Ho: promoA=promoB
result<-t.test(promoA, promoB,alternative = "two.sided")
# data:  promoA and promoB
# t = 113.72, df = 192.31, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   147.8062 153.0237
# sample estimates:
#   mean of x mean of y 
# 550.3321  399.9171 

ifelse(result$p.value <= 0.05, "sig","not sig")
#"sig"
