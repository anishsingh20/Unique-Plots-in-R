#Lollipop Chart

require(ggplot2)
require(dplyr)
theme_set(theme_bw())

#Summarising Data
city_mpg<- mpg %>%
            group_by(manufacturer) %>%
            summarise(Mileage = mean(cty),count=n())


#Plot
ggplot(city_mpg , aes(x = manufacturer,y = Mileage)) + 
  geom_point(size=8,color="red",alpha=0.9) + 
  geom_text(aes(label=round(Mileage)),color="white" , size=3) +
  geom_segment(aes(x = manufacturer, xend = manufacturer , 
                       y = 0 , yend = Mileage)) +
  labs(title="Lollipop Plot",x = "Manufacturer", y = "Miles Per Gallon",subtitle="Model vs Mileage") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))