#Slope Chart
#Slope charts are an excellent way of complotaring the plot positional placements 
#between 2 points on time.

require(ggplotlot2)
require(scales)

theme_set(theme_classic())

#plotreplotaring data
gdpdata <-read.csv("https://raw.githubusercontent.com/anishsingh20/datasets/master/gdppercap.csv")
colnames(gdpdata) <- c("continent", "1952", "1957")
left_label <- paste(gdpdata$continent, round(gdpdata$`1952`),sep=", ")
right_label <- paste(gdpdata$continent, round(gdpdata$`1957`),sep=", ")
gdpdata$class <- ifelse((gdpdata$`1957` - gdpdata$`1952`) < 0, "red", "blue")

# plot
plot <- ggplot(gdpdata) + geom_segment(aes(x=1, xend=2, y=`1952`, yend=`1957`, col=class), size=.75, show.legend=F) + 
  geom_vline(xintercept=1, linetype="dashed", size=.1) + 
  geom_vline(xintercept=2, linetype="dashed", size=.1) +
  scale_color_manual(labels = c("Up", "Down"), 
                     values = c("blue"="#133fce", "red"="#e50202")) +  # color of lines
  labs(x="GDP Change per cap", y="Mean GdpPerCap") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(1.1*(max(gdpdata$`1952`, gdpdata$`1957`))))  # X and Y axis limits

# Add texts
plot <- plot + geom_text(label=left_label, y=gdpdata$`1952`, x=rep(1, NROW(gdpdata)), hjust=1.1, size=3.5)
plot <- plot + geom_text(label=right_label, y=gdpdata$`1957`, x=rep(2, NROW(gdpdata)), hjust=-0.1, size=3.5)
plot <- plot + geom_text(label="Time 1", x=1, y=1.1*(max(gdpdata$`1952`, gdpdata$`1957`)), hjust=1.2, size=5)  # title
plot <- plot + geom_text(label="Time 2", x=2, y=1.1*(max(gdpdata$`1952`, gdpdata$`1957`)), hjust=-0.1, size=5)  # title

# Minify theme
plot + theme(panel.background = element_blank(), 
          panel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.text.x = element_blank(),
          panel.border = element_blank(),
          plot.margin = unit(c(1,2,1,2), "cm"))