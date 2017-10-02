
setwd("D:/REVA/Finance")
install.packages("rpart")
library(rpart)
##Read the data in the file
cust_data<-read.csv("Default_On_Payment.csv")

fit<-rpart(Default_On_Payment~Status_Checking_Acc+Credit_History, data=cust_data, method="class", 
           control=rpart.control(minsplit=50, cp=0.001))


##display complexity parameter table
printcp(fit)

plotcp(fit)

###detailed results including splits
summary(fit)

printcp(fit)

pfit<- prune(fit, cp = 0.001)

###plot decision tree 
plot(pfit, uniform=TRUE, main="Classification Tree for Default_on_payment")

###label the decision tree plot 
text(pfit,splits = TRUE, use.n=TRUE, all=TRUE, cex=0.5, pretty=1)

labels(pfit)

install.packages("rpart.plot")
library(rpart.plot)

prp(pfit, type=3, extra=2, under=TRUE)
