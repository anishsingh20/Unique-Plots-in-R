#Dumbell Chart
#Dumbell plots are also a great Tool to vislaualize the Relative Positions between the 2 points
#like Growth and Decline

require(ggplot2)
devtools::install_github("hrbrmstr/ggalt")
require(ggalt)
theme_set(theme_classic())

#Loading the Dataset
health<-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/health.csv")
