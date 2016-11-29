stone <- diamonds
library(ggplot2)
ggplot(stone, aes(x = x, y = price)) + 
  geom_point() +
  geom_smooth()

with( stone, cor.test(x, price))
with( stone, cor.test(y, price))
with( stone, cor.test(z, price))


ggplot(stone, aes(x = depth, y = price)) + 
  geom_point(alpha = 1/100) +
  scale_x_continuous(breaks = seq(0,100, 2))

with( stone, cor.test(depth, price))

ggplot(stone, aes(x = carat, y = price)) + 
  geom_point(shape = 1) +
  xlim(c(0, quantile(stone$carat, 0.99))) +
  ylim(c(0, quantile(stone$price, 0.99)))


stone$volume = stone$x * stone$y * stone$z
ggplot(stone, aes(x = volume, y = price)) + 
  geom_point(shape = 1) 

with( subset(stone, volume < 800 & volume > 0), cor(volume, price))

stone_clear <- subset(stone, volume < 800 & volume > 0)

ggplot(stone_clear, aes(x = volume, y = price)) + 
  geom_point(shape = 1) +
  geom_smooth()

library(dplyr)
diamondsByClarity <- stone_clear %>%
  group_by(clarity) %>%
  summarise(mean_price = mean(price),
            median_price = median(price),
            min_price = min(price),
            max_price = max(price),
            n = n()) %>%
  arrange(clarity)

library(gridExtra)

p1 <- ggplot(stone_clear, aes(x = volume, y = price)) + 
  geom_bar()
p2 <- ggplot(stone_clear, aes(x = clarity, y = price)) + 
  geom_bar()

grid.arrange(p1, p2)











