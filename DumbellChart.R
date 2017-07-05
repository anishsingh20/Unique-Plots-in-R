#Dumbell Chart
#Dumbell plots are also a great Tool to vislaualize the Relative Positions between the 2 points
#like Growth and Decline

require(ggplot2)
devtools::install_github("hrbrmstr/ggalt")
require(ggalt)
theme_set(theme_classic())

#Loading the Dataset
health<-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/health.csv")
health$Area <- factor(health$Area, levels=as.character(health$Area))  
# ordering of the dumbells


#Making the Plot

plot<-ggplot(aes(x=pct_2013*100,xend=pct_2014*100,y=Area , group = Area),data = health) +
  geom_dumbbell(colour_x="#2D54ED",
                size_x=2.5,
                color="#8299F3",
                size_xend = 2.5,
                colour_xend="#48D5EA",
                size=1.5) + 
  labs(x="Percentage", 
       y="City", 
       title="Dumbell Plot for Positional Changes between 2 points", 
       subtitle="Percent Change: 2013 vs 2014") + 
        theme(plot.title = element_text(hjust=0.5, face="bold"),
        plot.background=element_rect(fill="#f7f7f7"),
        panel.background=element_rect(fill="#f7f7f7"),
        panel.grid.minor=element_blank(),
        panel.grid.major.y=element_blank(),
        panel.grid.major.x=element_line(),
        axis.ticks=element_blank(),
        legend.position="top",
        panel.border=element_blank())
