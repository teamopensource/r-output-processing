args <- commandArgs(trailingOnly = TRUE)

if(length(args) < 2)
{
	stop("USAGE: script.r [input file (.r)] [output file (.svg)]")
}

input <- args[1]
output <- args[2]

header <- c("Start Time", "Sample Time(ms)", "Label", "Status Code", "Status", "Thread Name", "Data type", "Success", "Bytes", "Latency")
res200 <- read.csv(input, header = FALSE)
colnames(res200) <- header


# filter and plot
filnplot <- function(data, grepby, column)
{
	ylimit <- 25000
	filtered <- subset(data, grepl(grepby, Label))
	yaxis <- filtered[,column]
	plot(c(1:200), yaxis, ylim=c(0, ylimit), main=grepby, xlab="Sample#", panel.first = grid())
}

#dev.new(width=8, height=8)
svg(output, width=8, height=8)

par(mfrow=c(2,2)) # Enable 2-by-2 overview
filnplot(res200, "GET: Login", "Latency")
filnplot(res200, "POST: Login", "Latency")
filnplot(res200, "GET: Poll", "Latency")
filnplot(res200, "POST: Poll", "Latency")

dev.off()