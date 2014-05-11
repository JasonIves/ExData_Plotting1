## Code assumes household_power_consumption.txt (file created
## 12 October 2012 1:38:54PM) from
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## is stored in working directory

## Read in data
dRaw <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings="?", stringsAsFactors = FALSE)

## Subset data for dates in question
d <- subset(dRaw, Date == "1/2/2007" | Date == "2/2/2007")

## Create PNG file of histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(d$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()