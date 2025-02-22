allData <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
allData$FullDate <- strptime(paste(allData$Date,allData$Time), "%d/%m/%Y %H:%M:%S")
isAfterBegin <- (allData$FullDate >= strptime("2007-02-01","%Y-%m-%d"))
isBeforeEnd  <- (allData$FullDate <  strptime("2007-02-03","%Y-%m-%d"))
data <- allData[isAfterBegin & isBeforeEnd,]

png("plot4.png",480,480)
par(mfcol=c(2,2))
plot(data$FullDate, data$Global_active_power, type='l', xlab="", ylab="Global Active Power")

plot(data$FullDate, data$Sub_metering_1,type='l', xlab="", ylab="Energy sub metering")
lines(data$FullDate, data$Sub_metering_2,col='red')
lines(data$FullDate, data$Sub_metering_3,col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lwd=1, bty="n");

plot(data$FullDate, data$Voltage, type='l',xlab="datetime", ylab="Voltage")

plot(data$FullDate, data$Global_reactive_power, type='l',
     xlab="datetime", ylab="Global_reactive_power")
dev.off()
