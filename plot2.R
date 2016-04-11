fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- paste(getwd(),"/HHpowerconsumption.zip", sep="")
download.file(fileUrl, destfile)
unzip(destfile)

data <- read.table(paste(getwd(),"/household_power_consumption.txt", sep=""), nrows=3000, header=FALSE, skip=66600, sep=";", stringsAsFactors=FALSE)
data <- data[38:2917,]
data[["Date"]] <- strptime(data$V1, format = "%d/%m/%Y")
data[["Time"]] <- strptime(paste(data$V1,data$V2), format = "%d/%m/%Y %H:%M:%S")

par(mar=c(5,5,4,2))
plot(data$Time, data$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,'plot2.png')
dev.off()
