## Plot 1
hpc <- read.table("household_power_consumption.txt", stringsAsFactor = FALSE, 
                  sep = ";", header = TRUE)
feb1to2year2017 <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(feb1to2year2017$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()