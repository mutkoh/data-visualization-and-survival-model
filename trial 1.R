attach(framingham_dataset)
#question 3
library(dplyr)
framingham_dataset$season<-as.factor( case_when(
  month<=3~"1",
  month<=6~"2",
  month<=9~"3",
  month<=12~"4"
))

head(framingham_dataset)
library(ggplot2)
plot1<-ggplot(data = framingham_dataset,aes(x=season))+geom_bar()+ggtitle('distribution of seasonal effect')
print(plot1)
#question4
#chd_p<-framingham_dataset%>%filter(chdfate==1)
#chd_n<-framingham_dataset%>%filter(chdfate!=1)
#table1<-table(framingham_dataset$chdfate,framingham_dataset$sex,mean(framingham_dataset$age))

framingham_dataset$sex<-factor(framingham_dataset$sex,levels=1:2,labels=c('male','female'))
framingham_dataset$chdfate<-factor(framingham_dataset$chdfate,levels = 0:1,labels = c('stayed negative','turned positive'))

library(table1)
table1 <-table1(~age+sex+season+sbp+scl+bmi|chdfate,data=framingham_dataset)
table1


#question 5
obese<-framingham_dataset%>%filter(bmi>=30)
attach(obese)
table2<-table1(~age+sex+sbp|chdfate,data=obese)
table2


#question6
library(ggplot2)
attach(framingham_dataset)
plot1<-ggplot(data=framingham_dataset,aes(x=sex,y=sbp))+geom_boxplot()+ggtitle('relationship between gender and sbp')
plot1
#the female sbp is more spread compared to male sbp with more extreme values.
plot2<-ggplot(data=framingham_dataset,aes(x=sex,y=bmi))+geom_boxplot()+ggtitle('relationship between gender and bmi')
plot2


#plot3<-ggplot(data=framingham_dataset,aes(x=sex,y=season))+geom_boxplot()+ggtitle('relationship between gender and sbp')
#plot3

#question 7
#chd_p<-framingham_dataset%>%filter(chdfate=='turned positive')
#attach(chd_p)


#question8

