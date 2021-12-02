#
#
# example to show plot area 
# show use of multi panel
#
#

# get the working directory
getwd()
# set working dir


dims <- c(5, 8)
col.t <- c("blue", "red")

# ------------------------------------------------------------------------------
pdf("general.layout1.pdf", width = dims[1], height = dims[2] )
par(mar = c(4, 4, 3, 2), oma = c(3, 3, 3, 3))
y <- x <- c(1:10)
xlim.t <- range(x)
ylim.t <- range(y)
#plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
plot(NA, xlim = xlim.t, ylim = ylim.t)

text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT AREA")

mtext("PLOT MARGIN (mar = c(4, 4, 3, 2))", side = 3, line = 1, col = col.t[1])
box("figure", col = col.t[1])
mtext("l = 0", side = 3, line = 0, col = col.t[1], adj = 1)
mtext("l = 1", side = 3, line = 1, col = col.t[1], adj = 1)
mtext("l = 2", side = 3, line = 2, col = col.t[1], adj = 1)
#mtext("l = 3", side = 3, line = 3, col = col.t[1], adj = 1)


mtext("OUTER MARGIN (oma = c(3, 3, 3, 3))", side = 1, line = 1, col = col.t[2], outer = TRUE)
box("outer", col = col.t[2])
mtext("l = 0", side = 1, line = 0, col = col.t[2], adj = 1, outer = TRUE)
mtext("l = 1", side = 1, line = 1, col = col.t[2], adj = 1, outer = TRUE)
mtext("l = 2", side = 1, line = 2, col = col.t[2], adj = 1, outer = TRUE)
#mtext("l = 3", side = 1, line = 2.5, col = col.t[2], adj = 1, outer = TRUE)
box("outer", col = col.t[2])
dev.off()





# ------------------------------------------------------------------------------
# --- multiple panels ---
# ------------------------------------------------------------------------------


# two rows, one column
par(mfcol = c(2,1))

par(oma = c(3, 3, 3, 3))

# first plot
par(mar = c(3, 3, 3, 3))
plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT 1")
box("figure", col = col.t[1])
mtext("PLOT 1 MARGIN (mar = c(3, 3, 3, 3))", side = 3, line = 1, col = col.t[1])


# plot 2
par(mar = c(2, 1.5, 4, 0))
plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT 2")
box("figure", col = col.t[1])
box("outer", col = col.t[2])
mtext("PLOT 2 MARGIN (mar = c(2, 1.5, 4, 0))", side = 3, line = 1, col = col.t[1])

#
mtext("OUTER MARGIN (oma = c(3, 3, 3, 3))", side = 3, line = 1, col = col.t[2], outer = TRUE)



# ------------------------------------------------------------------------------
# --- multipanel using par(fig())

# fig() takes coordinates of the corners of the plotting region (mar)
# relative to the whole plotting region (oma)
# fig  takes c(x1, x2, y1, y2)

# quartz()
par(oma = c(1, 1, 1, 1))
pdf("general.layout2.pdf", width = dims[1], height = dims[2] )

par(fig = c(0, 0.5, 0, 1), mar = c(3, 3, 3, 3), xpd = NA)
plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT 1")
box("figure", col = col.t[1])
mtext("PLOT 1 MARGIN (mar = c(3, 3, 3, 3))", side = 3, line = 1, col = col.t[1])

par(new = TRUE, fig = c(0.5, 1, 0, 0.5))
plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT 2")
box("figure", col = col.t[1])
box("outer", col = col.t[2])


par(new = TRUE, fig = c(0.55, 0.95, 0.6, 0.95), mar = c(1, 2, 1, 1))
plot(NA, xlim = xlim.t, ylim = ylim.t, ylab = "", xlab = "", xaxt = "n", yaxt = "n")
text((0.5 * xlim.t[2]), (0.5 * ylim.t[2]), "PLOT 3")
box("figure", col = col.t[1])
box("outer", col = col.t[2])


mtext("OUTER MARGIN (oma = c(1, 1, 1, 1))", side = 3, line = 0, col = col.t[2], outer = TRUE)
dev.off()

# ------------------------------------------------------------------------------




