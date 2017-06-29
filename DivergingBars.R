#Diverging Dot Plot

attach(mtcars)
str(mtcars)

#making a column of Car Names 
mtcars$car_name<-rownames(mtcars)

#Normalizing the Miles Per Gallon
mtcars$mpg_norm<-round( (mpg - mean(mpg) )/ sd(mpg),2)
mtcars$mpg_type<-ifelse(mtcars$mpg_norm < 0  , "below","above")
#sorting the rows
mtcars<-mtcars[order(mtcars$mpg_norm),]
mtcars$car_name<- factor(mtcars$car_name, levels = mtcars$car_name)


#Plotting
ggplot(mtcars, aes(x=car_name, y=mpg_norm, label=mpg_norm)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#1E90FF", "below"="#00FF00")) + 
  labs(subtitle="Normalised mileage of Cars", 
       title= "Diverging Bars",x="Car Name", y = "Normalized Miles Per Gallon") + 
  coord_flip()

#Miles Per Gallon for Cars in Descending order 
ggplot(mtcars, aes(x=car_name, y=mpg, label=mpg)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5) + 
  coord_flip()