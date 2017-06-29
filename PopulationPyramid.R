#A Population Pyramid

#Population pyramids offer a unique way of visualizing how much population or what 
#percentage of population fall under a category. 
#The below pyramid is an excellent example 
#of how many users are retained at each stage of a email marketing campaign funnel.

#requiring dependencies

require(ggplot2)
require(ggthemes)

options(scipen = 999) #turns scientific notations in from 1e+10 etc

#Reading the data
email<-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/email_campaign_funnel.csv")
str(email)

#x-axis Breaks and Labels 
breaks <- seq(-15000000, 15000000, 5000000)
labels = paste0(as.character(c(seq(15, 0, -5), seq(5, 15, 5))), "m")

#Plotting
  ggplot(data=email, aes(x = Stage, y = Users, fill = Gender)) +
    geom_bar(stat = "identity",width=0.5) + 
    scale_y_continuous(breaks=breaks , labels=labels) +
    coord_flip() + #Flipping coordinates 
    labs(title="Email Campaign Funnel") + 
    theme_economist() + #Setting theme
    theme(plot.title = element_text(hjust = .5), 
          axis.ticks = element_blank())  # Centre plot title
 
  
  