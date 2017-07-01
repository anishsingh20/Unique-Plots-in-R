#Diverging Dot Plot

#It is also used in plotting a Categorical vs a Continious Variable

require(ggplot2)
theme_set(theme_bw())



#Plotting

ggplot(aes(x = car_name,y = mpg_norm ),data=mtcars) + 
  geom_point(aes(col=mpg_type),stat="identity",size= 6 ) + 
  scale_color_manual(name="Mileage",
                     labels = c("Above Average", "Below Average"),
                     values = c("above"="#00ba38", "below"="#f8766d")) + 
  geom_text(aes(label=mpg_norm),color="white",size= 2) + 
  labs(title="A diverging Plot",subtitle="Normalized Mileage") +
  ylim(-2.5, 2.5) +
  coord_flip()