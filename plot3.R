## Code assumes household_power_consumption.txt (created
## 12 October 2012 1:38:54PM) from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## is stored in working directory

## Read in data
dRaw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings="?", stringsAsFactors = FALSE)

## Subset data for dates in question
d <- subset(dRaw, Date == "1/2/2007" | Date == "2/2/2007")

## Convert Date to date class and create DateTime
## POSIX column
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d$DateTime <- strptime(paste(d$Date, d$Time, sep = " "), "%F %H:%M:%S")

## Create PNG file of plot
png(filename = "plot3.png", width = 480, height = 480)
plot(d$DateTime, d$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(d$DateTime, d$Sub_metering_1, type = "l", col = "black")
points(d$DateTime, d$Sub_metering_2, type = "l", col = "red")
points(d$DateTime, d$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()