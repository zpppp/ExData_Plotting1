## set working directory
setwd(".Household")

## Read data & change date/time format
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

## Subset data
subData <- data[data$Date>= "2007-02-01" & data$Date <= "2007-02-02",]

## Plot 1
hist(subData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save image
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
