# Data
groups <- c("Read", "Write")
values <- c(196, 24)

# Add percentage to labels
pcts <- round(values/sum(values)*100)
labels <- paste(groups, " (", pcts, sep="") 
labels <- paste(labels,"%)",sep="")

#dev.new(width=8, height=8)
svg("db_pie1.svg", width=8, height=6)

pie(values, labels = labels, main="Read/Write query distribution during quiz")

dev.off()