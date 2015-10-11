allData <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
allData$FullDate <- strptime(paste(allData$Date,allData$Time), "%d/%m/%Y %H:%M:%S")
isAfterBegin <- (allData$FullDate >= strptime("2007-02-01","%Y-%m-%d"))
isBeforeEnd  <- (allData$FullDate <  strptime("2007-02-03","%Y-%m-%d"))
data <- allData[isAfterBegin & isBeforeEnd,]

png("plot1.png",480,480)
hist(data$Global_active_power, main="Global Active Power",
     xlab="Gloal Active Power (kilowatts)", col='red')
dev.off()
