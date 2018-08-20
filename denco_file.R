#install.packages('gsheet')
library(gsheet)
url = 'https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'
denco = as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)

#top 5 customers that were most loyal
library(dplyr)
denco %>% count(custname, sort = TRUE)
denco %>% group_by(custname) %>% summarise(n = n()) %>% arrange(desc(n))


#Summarise by Partnum
 df3a = aggregate(denco$revenue, by=list (denco$partnum), FUN=sum)
 head(df3a)
 
 denco %>% group_by(partnum) %>% summarise(n= n()) %>% arrange(desc(n))
 
 # which parts have the highest Profit : Partnum - sum(profit)
 name(sales)
 df4a = aggregate(margin ~ partnum, data=sales, FUN=sum)
 aggregate(margin ~ partnum, data=sales, FUN=sum)
 head(df4a[order(df4a$margin, decreasing = T), ])
 
 sales %>% group_by(partnum) %>% summarise(TotalMargin = sum(margin))