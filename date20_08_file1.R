#Baisc stats
x = ceiling(rnorm(10000, mean = 60, sd = 20))
mean(x)
median(x)
# there is no mode function for mode stats
table(x)
sort(table(x), decreasing = T)


library(modeest)
mlv(x, method='shorth')
