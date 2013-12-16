res <- read.csv("/home/niels/jmeter/results/131125-1837-quiz-100/inotify1.csv", header = TRUE)

groups <- c("core_string", "core_plugintypes", "core_config", "core_pluginlist", "core_htmlpurifier", "core_questiondata", "core_databasemeta", "core_coursecontacts", "core_yuimodules", "core_password_compat")

totals <- c()
access <- c()
close_nowrite <- c()
open <- c()

# Collect groups of data
for (i in 1:length(groups))
{
	gsubset <- subset(res, grepl(groups[i], filename))
	totals[i] <- sum(gsubset[,"total"])
	access[i] <- sum(gsubset[,"access"])
	close_nowrite[i] <- sum(gsubset[,"close_nowrite"])
	open[i] <- sum(gsubset[,"open"])
}

# Add percentage to labels
pcts <- round(totals/sum(totals)*100)
labels <- paste(groups, " (", pcts, sep="") 
labels <- paste(labels,"%)",sep="")

#dev.new(width=8, height=8)
svg("inotify_pie1.svg", width=8, height=6)

#layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE))

pie(totals, labels = labels)
#pie(access, labels = groups, main="Access")
#pie(close_nowrite, labels = groups, main="Close (No Write)")
#pie(open, labels = groups, main="Open")

dev.off()