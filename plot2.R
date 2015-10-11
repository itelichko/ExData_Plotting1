allData <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
allData$FullDate <- strptime(paste(allData$Date,allData$Time), "%d/%m/%Y %H:%M:%S")
isAfterBegin <- (allData$FullDate >= strptime("2007-02-01","%Y-%m-%d"))
isBeforeEnd  <- (allData$FullDate <  strptime("2007-02-03","%Y-%m-%d"))
data <- allData[isAfterBegin & isBeforeEnd,]

png("plot2.png",480,480)
plot(data$FullDate, data$Global_active_power, type='l',
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
