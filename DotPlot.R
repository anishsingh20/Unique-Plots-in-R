#Dot Plot
#but without the line and is flipped to horizontal position.
#It emphasizes more on the rank ordering of items with respect to 
#actual values and how far apart are the entities with respect to each other.

#Dot plots are a good way to Plot a Continious and a Categorical Variable by modulating
#geom_point() .More useful in plotting Ranks Orderings of Categories vs some Continious value


library(ggplot2)
library(scales)

theme_set(theme_classic())
#using data set 'mpg'
attach(mpg)

#creating a new data frame with Manufacturer and Mileage
city_mpg<-mpg %>% 
    group_by(manufacturer) %>%
    summarise(Mileage = mean(cty),count=n()) %>%
    arrange(Mileage)

#ordering the rows on the basis of Mileage
city_mpg <- city_mpg[order(city_mpg$Mileage), ] 
city_mpg$manufacturer <- factor(city_mpg$manufacturer, levels = city_mpg$manufacturer)

#Plotting
ggplot(aes(x =manufacturer,y=Mileage),data = city_mpg ) + 
  geom_point(aes(size=count), col="purple") +
  geom_segment(aes(
                   x=manufacturer, 
                   xend=manufacturer, 
                   y=max(Mileage), 
                   yend=min(Mileage)), 
                   linetype="dashed", 
                   size=0.1) +
  coord_flip() + 
  labs(title="Plot of Manufacturer vs Mean of Mileage", 
       x = "Manufacturer" , y ="Mean Mileage",size="Count of Vehicles")
  
