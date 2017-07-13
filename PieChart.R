#Piechart

library(ggplot2)
theme_set(theme_classic())

#Making the Pie Chart on mpg dataset

#making a Data frame consisting of Cartypes and its frequency

Carclass<-as.data.frame(table(mpg$class))

#giving new names to the columns
names(Carclass)<-c("class","count")

#Making the Plot
 
plot<-ggplot(aes(x = "" , y = count,fill=factor(class)),data = Carclass) + 
  geom_bar(width=1 , stat="identity") + 
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
        labs(title="Pie Chart of distributions of the Class of Cars",
             x=NULL,y=NULL , fill = 'Class of cars')
  