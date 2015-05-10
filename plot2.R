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

## Plot 2
with(subData, plot(Global_active_power~DateTime, ylab="Global Active Power (kilowatts)",type="l"))

## Saving image
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
