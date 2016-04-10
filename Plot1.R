## stream the Text file and drop the data with ?s 
powerData <- read.csv("household_power_consumption.txt", sep =";", na.strings ="?")

## Lets get only the records for the dates we require
powerDataFiltered <- subset(powerData, Date == "1/2/2007" | Date =="2/2/2007")

## initialize .png
png(file="plot1.png",width=480,height=480,units='px')

## plot the graph in two steps
hist(as.numeric(as.character(powerDataFiltered$Global_active_power)), 
col = "red", main = "Global Active Power", xlab = "gobal active power (KW)")

## closing the connection
dev.off()
