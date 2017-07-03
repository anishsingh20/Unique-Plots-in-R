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


#Plotting
plot<-ggplot(gdpdata) + geom_segment(aes(x=1,xend=2,y='1952',yend='1957',col=class),size = .85,show.legend = FALSE) +
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Up", "Down"), 
                     values = c("blue"="#5B6CDC", "red"="#f8766d")) +  # color of lines
  labs(x="", y="Mean of GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(1.1*(max(gdpdata$`1952`, gdpdata$`1957`))))


  
  

