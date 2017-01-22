## Plot 2
hpc <- read.table("household_power_consumption.txt", stringsAsFactor = FALSE, 
                  sep = ";", header = TRUE)
feb1to2year2017 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(feb1to2year2017$Global_active_power)
datetime <- strptime(
        paste(feb1to2year2017$Date, feb1to2year2017$Time, sep=" "), 
        "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()