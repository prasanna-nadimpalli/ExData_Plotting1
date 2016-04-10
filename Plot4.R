library(lubridate)

## Get and clean the data
powerData <- read.csv("household_power_consumption.txt", sep =";", na.strings ="?")

powerDataFiltered <- subset(powerData, Date == "1/2/2007" | Date =="2/2/2007")

powerDataFiltered.2 <- transform(powerDataFiltered, Datetime = as.POSIXlt(dmy(powerDataFiltered$Date)+hms(powerDataFiltered$Time)))

png(file="plot4.png",width=480,height=480,units='px')

## plan the arrangment of graphs 2x2
par(mfrow=c(2,2))
    
    ## top-left
plot(powerDataFiltered.2$Datetime,as.numeric(as.character(powerDataFiltered.2$Global_active_power)),ylab='Global Active Power',xlab='',type='l')
    
    ## top- right
plot(powerDataFiltered.2$Datetime,powerDataFiltered.2$Voltage,xlab='datetime',ylab='Voltage',type='l')
    
    
   ## bottom -left
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_2,col=lncol[2])
lines(powerDataFiltered.2$Datetime,powerDataFiltered.2$Sub_metering_3,col=lncol[3])
    
    ## bottom - right
    
plot(powerDataFiltered.2$Datetime,as.numeric(as.character(powerDataFiltered.2$Global_reactive_power)),xlab='date/time',ylab='Global_reactive_power',type='l')
   
    
dev.off()
    
