allData <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
allData$FullDate <- strptime(paste(allData$Date,allData$Time), "%d/%m/%Y %H:%M:%S")
isAfterBegin <- (allData$FullDate >= strptime("2007-02-01","%Y-%m-%d"))
isBeforeEnd  <- (allData$FullDate <  strptime("2007-02-03","%Y-%m-%d"))
data <- allData[isAfterBegin & isBeforeEnd,]

png("plot3.png",480,480)
plot(data$FullDate, data$Sub_metering_1,type='l', xlab="",
     ylab="Energy sub metering")
lines(data$FullDate, data$Sub_metering_2,col='red')
lines(data$FullDate, data$Sub_metering_3,col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1);
dev.off()
