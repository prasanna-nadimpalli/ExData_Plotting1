library(lubridate)

## get the input data
powerData <- read.csv("household_power_consumption.txt", sep =";", na.strings ="?")

powerDataFiltered <- subset(powerData, Date == "1/2/2007" | Date =="2/2/2007")

png(file="plot2.png",width=480,height=480,units='px')

##Get the data and time column into POSIX format

powerDataFiltered.2 <- transform(powerDataFiltered, Datetime = as.POSIXlt(dmy(powerDataFiltered$Date)+hms(powerDataFiltered$Time)))

## Plot the graph
plot(powerDataFiltered.2$Datetime,as.numeric(as.character(powerDataFiltered.2$Global_active_power)),ylab='Global Active Power (kW)', xlab='', type='l')

dev.off()
