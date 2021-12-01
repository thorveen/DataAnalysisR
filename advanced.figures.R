#
# make figures from scratch
#
# graph constants
cex.c <- c(1.5, 4)
alpha <- 99
col.c <- c(paste("#FF00FF",alpha, sep = ""), 
           paste("#33C2FF",alpha, sep = ""))
jitter.c <- 2.5
pch.c <- 17


# simulate data to make graph
n <- 10           # sample size
x <- c(1:n)       # x values for graph
y <- runif(n,0,3) # y values for graph

plot(x, y)

# set the length of the x and y axis through xlim
margin.x <- 0.1 * (max(x) - min(x))
margin.y <- 0.1 * (max(y) - min(y))
xlim.1 <- c(min(x)-margin.x, max(x) + margin.x)
ylim.1 <- c(min(y)-margin.y, max(y) + margin.y)

# plot with new x limits
plot(x,y, xlim = xlim.1, ylim = ylim.1)

# let's make an empty graphic sheet of size xlim.1 and ylim.1
plot(NA,ylim = ylim.1, xlim = xlim.1, xlab = "", ylab = "", 
     xaxt = "n", yaxt = "n", bty = "n")

points( x, y, pch = 19, cex = 2, col = "red")
axis(1,col = "red", lwd.ticks = 3) 
axis(2, c(0.5, 1,2), labels = c("small", "medium", "large"))

# let's make a dot plot with two groups and a numeric variable
A <- runif(10, 0,5)
B <- runif(10, 3,8)
# set the axis limits
xlim.2 <- c(0.5, 2.5)
ylim.2 <- c(min(c(A,B)), max(c(A,B)))

plot(NA,ylim = ylim.2, xlim = xlim.2, xlab = "", ylab = "uniform value", 
     xaxt = "n", las = 1)
axis(side = 1, c(1,2), c("A", "B"))
# add the points for A
points(jitter(rep(1, length(A)), jitter.c), A, cex = cex.c[2], pch = pch.c, 
       col = col.c[1])
points(jitter(rep(2, length(B)),jitter.c), B, cex = cex.c[2], pch = pch.c,
       col = col.c[2])
