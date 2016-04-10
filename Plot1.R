powerData <- read.csv("household_power_consumption.txt", sep =";", na.strings ="?")

powerDataFiltered <- subset(powerData, Date == "1/2/2007" | Date =="2/2/2007")

png(file="plot1.png",width=480,height=480,units='px')
    
hist(as.numeric(as.character(powerDataFiltered$Global_active_power)), 
col = "red", main = "Global Active Power", xlab = "gobal active power (KW)")
    
dev.off()
