# === description ===========================================================================
# scrip with analysis to show how to link Markdown and analysis code 

# ******************************************************************************
## use descriptive names 
# 1) data inspection
# 2) visualisation
# 3) analysis

# === 1) data inspection =======================================================
## @knitr one.analysis
# let's see the first six rows of the iris data set
d <- 3
d

## @knitr one
head(iris)

## @knitr one.end

# === 2) visualisation ===========================================================
## @knitr two
# let's make a graph of the sepal length vs sepal width
plot(iris$Sepal.Length, iris$Sepal.Width, xlab = "sepal length (cm)", ylab = 
       "sepal width (cm)", pch = 19, col = "grey")

# === 3) analysis ===========================================================
## @knitr three
# test of the sepal width differs for different species
m1 <- lm(iris$Sepal.Width ~ iris$Species)
summary(m1)[4]
