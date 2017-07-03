#Slope Chart
#Slope charts are an excellent way of comparing the positional placements 
#between 2 points on time.

require(ggplot2)
require(scales)

theme_set(theme_classic())

#Preparing data
gdpdata<-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/gdppercap.csv")

colnames(gdpdata)<-c("Contienent","1952","1957")

left_label <- paste(gdpdata$Contienent, round(gdpdata$`1952`),sep=", ")
right_label <- paste(gdpdata$Contienent, round(gdpdata$`1957`),sep=", ")

#Genearing classes to which the Contienents belong i.e GDP change from year 1952 to 1957
gdpdata$class <- ifelse((gdpdata$`1957` - gdpdata$`1952`) < 0, "red", "blue")

