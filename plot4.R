## Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(1,1,1,1))
hpc <- read.table("household_power_consumption.txt", stringsAsFactor = FALSE, 
                  sep = ";", header = TRUE)
feb1to2year2017 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(
        paste(feb1to2year2017$Date, feb1to2year2017$Time, sep=" "), 
        "%d/%m/%Y %H:%M:%S")
### [1,1]
globalActivePower <- as.numeric(feb1to2year2017$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
### [1,2]
plot(datetime, feb1to2year2017$Voltage, type = "l", ylab = "Voltage")
### [2,1]
Sub_metering_1 <- as.numeric(feb1to2year2017$Sub_metering_1)
Sub_metering_2 <- as.numeric(feb1to2year2017$Sub_metering_2)
Sub_metering_3 <- as.numeric(feb1to2year2017$Sub_metering_3)
plot(datetime, Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, type = "l", col = "red")
lines(datetime, Sub_metering_3, type = "l", col = "blue")
legend("topright", bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       lwd = 2.5,
       col = c("black", "red", "blue"))
### [2,2]
Global_reactive_power <- as.numeric(feb1to2year2017$Global_reactive_power)
plot(datetime, Global_reactive_power, type="l")
dev.off