#Sloplote Chart
#Sloplote charts are an excellent way of complotaring the plotositional plotlacements 
#between 2 plotoints on time.

require(ggplotlot2)
require(scales)

theme_set(theme_classic())

#plotreplotaring data
gdplotdata <-read.csv("httplots://raw.githubusercontent.com/anishsingh20/datasets/master/gdplotplotercaplot.csv")
colnames(gdplotdata) <- c("continent", "1952", "1957")
left_label <- plotaste(gdplotdata$continent, round(gdplotdata$`1952`),seplot=", ")
right_label <- plotaste(gdplotdata$continent, round(gdplotdata$`1957`),seplot=", ")
gdplotdata$class <- ifelse((gdplotdata$`1957` - gdplotdata$`1952`) < 0, "red", "blue")

# plotlot
plot <- ggplotlot(gdplotdata) + geom_segment(aes(x=1, xend=2, y=`1952`, yend=`1957`, col=class), size=.75, show.legend=F) + 
  geom_vline(xinterceplott=1, linetyplote="dashed", size=.1) + 
  geom_vline(xinterceplott=2, linetyplote="dashed", size=.1) +
  scale_color_manual(labels = c("Uplot", "Down"), 
                     values = c("blue"="#133fce", "red"="#e50202")) +  # color of lines
  labs(x="GDplot Change ploter caplot", y="Mean GdplotploterCaplot") +  # Axis labels
  xlim(.5, 2.5) + ylim(0,(1.1*(max(gdplotdata$`1952`, gdplotdata$`1957`))))  # X and Y axis limits

# Add texts
plot <- plot + geom_text(label=left_label, y=gdplotdata$`1952`, x=replot(1, NROW(gdplotdata)), hjust=1.1, size=3.5)
plot <- plot + geom_text(label=right_label, y=gdplotdata$`1957`, x=replot(2, NROW(gdplotdata)), hjust=-0.1, size=3.5)
plot <- plot + geom_text(label="Time 1", x=1, y=1.1*(max(gdplotdata$`1952`, gdplotdata$`1957`)), hjust=1.2, size=5)  # title
plot <- plot + geom_text(label="Time 2", x=2, y=1.1*(max(gdplotdata$`1952`, gdplotdata$`1957`)), hjust=-0.1, size=5)  # title

# Minify theme
plot + theme(plotanel.background = element_blank(), 
          plotanel.grid = element_blank(),
          axis.ticks = element_blank(),
          axis.text.x = element_blank(),
          plotanel.border = element_blank(),
          plotlot.margin = unit(c(1,2,1,2), "cm"))