
mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote="")
head(mydata)
#mydata$Date <- as.POSIXct(strptime(x = mydata$Date, format = "%d/%m/%Y"))

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

flags <- mydata$Date>=startDate & mydata$Date<=endDate
Gap <- as.numeric(as.character(mydata$Global_active_power))
plotData <- Gap[flags & !is.na(Gap)]

png( filename="plot1.png" )
hist( plotData, breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red" )
dev.off()