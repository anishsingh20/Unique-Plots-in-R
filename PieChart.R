#Piechart

library(ggplot2)
theme_set(theme_dark())

#Making the Pie Chart on mpg dataset

#making a Data frame consisting of Cartypes and its frequency

Carclass<-as.data.frame(table(mpg$class))

#giving new names to the columns
names(Carclass)<-c("class","count")

