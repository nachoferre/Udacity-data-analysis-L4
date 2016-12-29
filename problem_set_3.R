library(ggplot2)
diamonds <- diamonds
#price histogram
ggplot(diamonds, aes(x = price)) + geom_histogram(binwidth = 100, aes(color = cut)) +
  facet_wrap(~ color)
#price vs table
ggplot(diamonds, aes(y = price, x = table)) + 
  geom_point(aes(color = cut))
#price vs volume
diamonds$volume = (diamonds$x * diamonds$y * diamonds$z)
ggplot(data = diamonds, aes(y = log10(price), x = volume)) + 
  geom_point(aes(color = clarity)) +
  coord_cartesian(xlim = c(0,quantile(diamonds$volume, 0.99)))

#creation of prop_initiated
pf$prop_initiated <- pf$friendships_initiated/pf$friend_count
summary(pf)

#prop_initiated vs tenure

ggplot(data = pf, aes(x = tenure, y = prop_initiated)) +
  geom_line(aes(color = year_joined.bucket), stat = "summary", fun.y = median)

ggplot(data = pf, aes(x = tenure, y = prop_initiated)) +
  geom_line(aes(color = year_joined.bucket), stat = "summary", fun.y = median) +
  geom_smooth()


group1 <- subset(pf,
                 year_joined.bucket == '(2012,2014]')

summary(group1$prop_initiated)

#price/carat ratio
ggplot(data = diamonds, aes(x = cut, y = price/carat)) +
  geom_jitter(aes(color = color)) +
  facet_wrap(~ clarity)


