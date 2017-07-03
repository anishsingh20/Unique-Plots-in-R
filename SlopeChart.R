#Slope Chart
#Slope charts are an excellent way of comparing the positional placements 
#between 2 points on time.

require(ggplot2)
require(scales)

theme_set(theme_classic())

#Preparing data
gdpdata<-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/gdppercap.csv")

colnames(gdpdata)<-c("Contienent","1952","1957")
