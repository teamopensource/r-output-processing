library("stringr")

args <- commandArgs(trailingOnly = TRUE)
quizpath1 <- args[1]
quizpath2 <- args[2]
quizpath3 <- args[3]
quizpath4 <- args[4]
quizpath5 <- args[5]
quizpath6 <- args[6]
quizpath7 <- args[7]
quizpath8 <- args[8]
outpath <- args[9]
title <- args[10]
 
readnparse <- function(path)
{
	# Parse and add header
	header <- c("Start Time", "Sample Time(ms)", "Label", "Status Code", "Status", "Thread Name", "Data type", "Success", "Bytes", "Latency")
	res <- read.csv(path, header = FALSE)
	colnames(res) <- header
	return(res)
}

quiz1 <- readnparse(quizpath1)
quiz2 <- readnparse(quizpath2)
quiz3 <- readnparse(quizpath3)
quiz4 <- readnparse(quizpath4)
quiz5 <- readnparse(quizpath5)
quiz6 <- readnparse(quizpath6)
quiz7 <- readnparse(quizpath7)
quiz8 <- readnparse(quizpath8)

# Output to SVG
svg(outpath, width=10, height=6)

# Adjust axis margins
par(mgp=c(3,1.5,0))

# Draw boxplot
labels <- c("Nginx\n25 users","Nginx\n30 users","Nginx\n40 users","Nginx\n50 users","Nginx\n75 users","Apache\n25 users","Apache\n30 users","Apache\n40 users")
cmpvals <- boxplot(x = quiz1[,"Sample Time(ms)"],quiz2[,"Sample Time(ms)"],quiz3[,"Sample Time(ms)"],quiz4[,"Sample Time(ms)"],quiz5[,"Sample Time(ms)"],quiz6[,"Sample Time(ms)"],quiz7[,"Sample Time(ms)"],quiz8[,"Sample Time(ms)"], names = labels, ylab = "Sample Time (ms)", outline = FALSE)

# Draw mean points
means <-c(mean(quiz1[,"Sample Time(ms)"]),mean(quiz2[,"Sample Time(ms)"]),mean(quiz3[,"Sample Time(ms)"]),mean(quiz4[,"Sample Time(ms)"]),mean(quiz5[,"Sample Time(ms)"]),mean(quiz6[,"Sample Time(ms)"]),mean(quiz7[,"Sample Time(ms)"]),mean(quiz8[,"Sample Time(ms)"]))
points(means, pch=3)

# Draw mean text
tmeans <- round(means, digits=0)
text(x=c(1:8), y=tmeans, labels=tmeans, pos=4)

# output computed stats to terminal
cmpvals$stats

dev.off()