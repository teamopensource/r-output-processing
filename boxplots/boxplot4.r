library("stringr")

args <- commandArgs(trailingOnly = TRUE)
quizpath1 <- args[1]
quizpath2 <- args[2]
quizpath3 <- args[3]
outpath <- args[4]
title <- args[5]

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

# Output to SVG
svg(outpath, width=10, height=6)

# Adjust axis margins
par(mgp=c(3,1.5,0))

# Draw boxplot
labels <- c("50 users\n1 web server","100 users\n2 web servers","150 users\n3 web servers")
cmpvals <- boxplot(x = quiz1[,"Sample Time(ms)"],quiz2[,"Sample Time(ms)"],quiz3[,"Sample Time(ms)"], names = labels, ylab = "Sample Time (ms)", outline = FALSE)

# Draw mean points
means <-c(mean(quiz1[,"Sample Time(ms)"]),mean(quiz2[,"Sample Time(ms)"]),mean(quiz3[,"Sample Time(ms)"]))
points(means, pch=3)

# Draw mean text
tmeans <- round(means, digits=0)
text(x=c(1:3), y=tmeans, labels=tmeans, pos=4)

# output computed stats to terminal
cmpvals$stats

dev.off()