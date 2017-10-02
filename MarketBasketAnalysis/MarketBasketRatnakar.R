
### Set the work directory, change as per your work folder
setwd("D:/REVA/Finance/MarketBasketAnalysis")

### Import/read the data
txn_data<-read.csv("Retail_Data.csv")

### See the data summary (verify Data)
head(txn_data)

tail(txn_data)

summary(txn_data)

str(txn_data)

for ( i in 1:ncol(txn_data))
{
  txn_data[,i]=as.factor(txn_data[,i])
}

install.packages("arules")
library(arules)

basket_rules <- apriori(txn_data, parameter = list(sup = 0.005, conf = 0.01, target="rules",minlen=2,maxlen=3), appearance = list(rhs=c("Product3=Dairy", "Product3=Egg"), default = "lhs"))

summary(basket_rules)

inspect(basket_rules) 
inspect(head(sort( basket_rules,by="lift"),20)) 

install.packages("arulesViz")
library(arulesViz)
install.packages("diptest")
library(diptest)

plot(basket_rules)
plot(basket_rules, method="graph", control=list(type="items"))
