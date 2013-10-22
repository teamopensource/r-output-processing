args <- commandArgs(trailingOnly = TRUE)

if(length(args) < 3)
{
	stop("USAGE: script.r [input folder] [output file (.svg)] [postfix]")
}

input <- args[1]
output <- args[2]
postfix <- args[3]
matchfor <- "GET: Poll"

# parse j-meter output
parse <- function(file)
{
	header <- c("Start Time", "Sample Time(ms)", "Label", "Status Code", "Status", "Thread Name", "Data type", "Success", "Bytes", "Latency")
	result <- read.csv(file, header = FALSE)
	colnames(result) <- header
	return(result)
}

# filter and plot
filnplot <- function(data, grepby, column)
{
	ylimit <- 25000
	filtered <- subset(data, grepl(grepby, Label))
	yaxis <- filtered[,column]
	plot(c(1:length(yaxis)), yaxis, ylim=c(0, ylimit), main=grepby, xlab="Sample#", panel.first = grid())
}

res50 = parse(paste(input, "50", postfix, sep=""))
res100 = parse(paste(input, "100", postfix, sep=""))
res150 = parse(paste(input, "150", postfix, sep=""))
res200 = parse(paste(input, "200", postfix, sep=""))

#dev.new(width=8, height=8)
svg(output, width=8, height=8)

par(mfrow=c(2,2)) # Enable 2-by-2 overview
filnplot(res50, matchfor, "Latency")
filnplot(res100, matchfor, "Latency")
filnplot(res150, matchfor, "Latency")
filnplot(res200, matchfor, "Latency")

dev.off()