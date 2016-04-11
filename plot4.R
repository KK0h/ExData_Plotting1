fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- paste(getwd(),"/HHpowerconsumption.zip", sep="")
download.file(fileUrl, destfile)
unzip(destfile)

data <- read.table(paste(getwd(),"/household_power_consumption.txt", sep=""), nrows=3000, header=FALSE, skip=66600, sep=";", stringsAsFactors=FALSE)
data <- data[38:2917,]
data[["Date"]] <- strptime(data$V1, format = "%d/%m/%Y")
data[["Time"]] <- strptime(paste(data$V1,data$V2), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(data$Time, data$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.7)

plot(data$Time, data$V5, type="l", xlab="datetime", ylab="Voltage", cex.lab=0.7)

plot(data$Time, data[,7], type="l", xlab="", ylab="Energy sub metering", cex.lab=0.7)
lines(data$Time, data[,8], type="l", col="red")
lines(data$Time, data[,9], type="l", col="blue")
legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6, inset=c(0.05,-0.1), y.intersp=0.3, bty="n")

plot(data$Time, data$V4, type="l", xlab="datetime", ylab="Global_reactive_power", cex.lab=0.7)

dev.copy(png,'plot4.png')
dev.off()
