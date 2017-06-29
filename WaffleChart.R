#Waffle Chart

#Waffle charts is a nice way of showing the categorical composition of the total population. 

require(ggplot2)

#using mpg automobile dataset
#var contains the class of cars
var<-mpg$manufacturer

#Preparing Data
nrows<-10
#Generating Data frame
df<-expand.grid(y=1:nrows,x=1:nrows)

#Frequency table which contains the count of cars in each class
table_manufactures <- round(0.06 +table(var) * ((nrows*nrows)/(length(var)))-.111)
table_manufactures # highest count of Dodge and Toyota
sum(table_manufactures) # the sum of the rows is now 100

#category column in df data frame
df$manufactures <- factor(rep(names(table_manufactures),table_manufactures))

#Plotting

ggplot(df, aes(x = x, y = y, fill = manufactures)) + 
  geom_tile(color = "black", size = 0.6) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0), trans = 'reverse') +
  scale_fill_brewer(palette = "Set3") +
  labs(title="Waffle Chart", subtitle="'Class' of vehicles")

ggplot(aes(x = ))

