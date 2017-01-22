## Plot 3
hpc <- read.table("household_power_consumption.txt", stringsAsFactor = FALSE, 
                  sep = ";", header = TRUE)
feb1to2year2017 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
Sub_metering_1 <- as.numeric(feb1to2year2017$Sub_metering_1)
Sub_metering_2 <- as.numeric(feb1to2year2017$Sub_metering_2)
Sub_metering_3 <- as.numeric(feb1to2year2017$Sub_metering_3)
datetime <- strptime(
        paste(feb1to2year2017$Date, feb1to2year2017$Time, sep=" "), 
        "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue"))
dev.off()