library("stringr")

args <- commandArgs(trailingOnly = TRUE)
quizpath1 <- args[1]
quizpath2 <- args[2]
quizpath3 <- args[3]
quizpath4 <- args[4]
outpath <- args[5]
title <- args[6]
 
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

# Output to SVG
svg(outpath, width=10, height=6)

# Adjust axis margins
par(mgp=c(3,1.5,0))

# Draw boxplot
labels <- c("2 processes\n25 users","2 processes\n50 users","4 processes\n25 users","4 processes\n50 users")
cmpvals <- boxplot(x = quiz1[,"Sample Time(ms)"],quiz2[,"Sample Time(ms)"],quiz3[,"Sample Time(ms)"],quiz4[,"Sample Time(ms)"], names = labels, ylab = "Sample Time (ms)", outline = FALSE)

# Draw mean points
means <-c(mean(quiz1[,"Sample Time(ms)"]),mean(quiz2[,"Sample Time(ms)"]),mean(quiz3[,"Sample Time(ms)"]),mean(quiz4[,"Sample Time(ms)"]))
points(means, pch=3)

# Draw mean text
tmeans <- round(means, digits=0)
text(x=c(1:4), y=tmeans, labels=tmeans, pos=4)

# output computed stats to terminal
cmpvals$stats

dev.off()