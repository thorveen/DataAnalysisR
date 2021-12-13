#
#
#
#

# use the standard data set mtcars
head(mtcars)
str(mtcars)

m.full <- lm(mpg ~ disp + hp + cyl + gear, data=mtcars)
plot(m.full)
summary(m.full)

#m.no.gear <- lm(mpg ~ disp + hp + cyl, data=mtcars)
#summary(m.no.gear)
#anova(m.full, m.no.gear)
library(corrplot)
summary(m.full)
rquery.cormat(c(2:4,10))

# disp is least significant
m.1 <- lm(mpg ~ hp + cyl + gear, data=mtcars)
summary(m.1)
# does removing this variable significantly reduces the variance explained?
anova(m.full, m.1)
# not significant, so we can exclude it -> check the table m.full

# what is the next least significant variable?
# cyl
m.2 <- lm(mpg ~ hp + gear, data=mtcars)
summary(m.2)
# does removing this variable significantly reduces the variance explained?
anova(m.1, m.2)
# not significant, so we can exclude it -> check summary(m.1) for p value

# what is the next one?
# gear, but it is significant... --> know the drill, check the summary(m.2)
m.3 <- lm(mpg ~ hp , data=mtcars)
summary(m.3)
anova(m.2, m.3)
# do not exclude, the is 'the' significant model
# final model: mpg ~ hp + gear

m.only.cyl <- lm(mpg ~ cyl, data=mtcars)
summary(m.only.cyl)


# lm uses a type III sum of squares
# aov a type I sum of squares
# couple of notes on type I and type III Sum of squares
m.full.1 <- aov(mpg ~ gear + disp  + hp + cyl , data=mtcars)
summary(m.full.1)
m.full.2 <- aov(mpg ~  disp + wt + hp + cyl + gear , data=mtcars)
summary(m.full.2)
# take: avoid aov. DP, use lm(), it is your friend.

# here comes AIC
# Aikaike information criterium for more info: 
# https://www.r-bloggers.com/2018/04/how-do-i-interpret-the-aic/

library(MASS)
step(m.full)



