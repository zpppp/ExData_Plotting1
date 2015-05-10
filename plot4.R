## set working directory
setwd(".Household")

## Read data
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")

## Create additional date/time column for plot and convert date
date_and_time <- paste(data$Date,data$Time)
data$DateTime <- strptime(date_and_time, format="%d/%m/%Y %H:%M:%S", tz="")
data$DateTime <- as.POSIXct(data$DateTime)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subset data
subData <- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]

## Create 2x2 plot
par(mfcol=c(2,2))

## Plot Top Left (Plot 2)
with(subData, plot(Global_active_power~DateTime, ylab="Global Active Power (kilowatts)",type="l"))

## Plot Bop Left (Plot 3)
with(subData, plot(Sub_metering_1~DateTime, ylab="Energy sub metering",type="l"))
with(subData, points(Sub_metering_2~DateTime, type="l", col="red"))
with(subData, points(Sub_metering_3~DateTime, type="l", col="purple"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","purple"), lty=1, pt.cex=0.5)

## Plot Top Right
with(subData, plot(Voltage~DateTime, ylab="Voltage", xlab="datetime",type="l"))

## Plot Bot Right
with(subData, plot(Global_reactive_power~DateTime, ylab="Global_reactive_power", xlab="datetime",type="l"))

###Saving the file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
