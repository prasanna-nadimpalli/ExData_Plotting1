library(lubridate)

powerData <- read.csv("household_power_consumption.txt", sep =";", na.strings ="?")

powerDataFiltered <- subset(powerData, Date == "1/2/2007" | Date =="2/2/2007")

powerDataFiltered.2 <- transform(powerDataFiltered, Datetime = as.POSIXlt(dmy(powerDataFiltered$Date)+hms(powerDataFiltered$Time)))

png(file="plot3.png",width=480,height=480,units='px')

lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')


plot(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_1, xlab='',ylab='Energy sub metering', type='l')
lines(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_2, col=lncol[2])
lines(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_3, col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

dev.off()
