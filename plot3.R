fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- paste(getwd(),"/HHpowerconsumption.zip", sep="")
download.file(fileUrl, destfile)
unzip(destfile)

data <- read.table(paste(getwd(),"/household_power_consumption.txt", sep=""), nrows=3000, header=FALSE, skip=66600, sep=";", stringsAsFactors=FALSE)
data <- data[38:2917,]
data[["Date"]] <- strptime(data$V1, format = "%d/%m/%Y")
data[["Time"]] <- strptime(paste(data$V1,data$V2), format = "%d/%m/%Y %H:%M:%S")

par(mar=c(5,5,4,2))
plot(data$Time, data[,7], type="l", xlab="", ylab="Energy sub metering")
lines(data$Time, data[,8], type="l", col="red")
lines(data$Time, data[,9], type="l", col="blue")
legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.6, x.intersp=1.2, y.intersp=0.8, adj=0.1)

dev.copy(png,'plot3.png')
dev.off()
