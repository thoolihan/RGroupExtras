library(ggplot2)
library(dplyr)
library(scales)

raw <- read.csv("RMembers.csv", 
                  colClasses = c("character", "integer", "integer"))
members <- 
  mutate(raw, 
  Date = as.Date(Date, "%m/%d/%y"))

g <- qplot(x = Date, y = Total.Members, data = members, geom = 'line',
      xlab = "Time", ylab = "Members", color = "Total", 
      main = "Cleveland R User Group") +
  scale_x_date(labels = date_format("%m/%Y")) + 
  geom_line(aes(y = Active.Members, color = "Active")) +
  scale_color_manual(values = c("#2565B4", "#9F9FA5")) + 
  theme(legend.title = element_blank(),
        legend.position = "left",
        panel.background = element_blank(),
        panel.grid.major = element_line(color = "#9F9FA5", size = 0.1),
        plot.title = element_text(size = 25, face = "bold", color = "#2565B4"))

print(g)