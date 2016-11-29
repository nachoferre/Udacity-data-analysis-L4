getwd()
setwd("~/Downloads")
statesInfo <- read.csv("stateData.csv")
View(statesInfo)

subset(statesInfo, state.region == 1)

statesInfo[statesInfo$state.region, ]


#---------------------------------------

reddit <- read.csv('reddit.csv')

str(reddit)
levels(reddit$age.range)

install.packages('ggplot2', dependencies = T)
library(ggplot2)
qplot(data=reddit, x= age.range)

levels(reddit$country.range)

?relevel
relevel(reddit$age.range, ref="Under 18")
aux <- factor(levels(reddit$age.range), levels = c("Under 18", "18-24", "25-34", "35-44", "45-54", "55-64", "65 or Above"))
aux
ordered(aux, levels= aux)
?ordered
