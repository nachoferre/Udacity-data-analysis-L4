data(diamonds)
library(ggplot2)
qplot(x=diamonds$price, data=diamonds  ,
      color = I("white"), 
      fill = I('#099DD9'),
      xlab = "Number of diamonds",
      ylab = "price of diamons",)+
  scale_x_continuous( breaks = seq(100, 1000, 100), limits=c(0,1000))
summary(diamonds)

sum(diamonds$price >= 15000)

qplot(x = price, data = diamonds) + facet_wrap(~cut)

by(diamonds$price, diamonds$cut, max)

qplot(x = price, data = diamonds) + facet_wrap(~cut, scales = "free")

qplot(y = price, x = color, data = subset(diamonds, !is.na(diamonds$carat)),
      geom = "boxplot") 
aux <- subset(diamonds, color =="J")

summary(aux)
IQR(subset(diamonds, color == "J")$price)
?diamonds

qplot(y = price, x = carat, data = subset(diamonds, !is.na(diamonds$carat)),
      geom = "boxplot") 

qplot(x = carat, data = diamonds, binwidth = 0.1,
      geom = 'freqpoly') +
  scale_x_continuous(limits = c(0, 3), breaks = seq(0, 10, 0.1)) +
  scale_y_continuous(breaks = seq(0,12000,1000))
