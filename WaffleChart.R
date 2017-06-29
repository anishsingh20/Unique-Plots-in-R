#Waffle Chart

#Waffle charts is a nice way of showing the categorical composition of the total population. 

require(ggplot2)

#using mpg automobile dataset
#var contains the class of cars
var<-mpg$class

#Preparing Data
nrows<-10
df<-expand.grid(y=1:nrows,x=1:nrows)

#Frequency table which contains the count of cars in each class
table_category <- round(table(var) * ((nrows*nrows)/(length(var))))
table_category

#category column in df data frame
df$category <- factor(rep(names(table_category), table_category))

#Plotting

ggplot(df, aes(x = x, y = y, fill = category)) + 
  geom_tile(color = "black", size = 0.6) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), trans = 'reverse') +
  scale_fill_brewer(palette = "Set1") +
  labs(title="Waffle Chart", subtitle="'Class' of vehicles")


