## Read in file and subset relevant data

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))
dfSub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )


## prep window
par(mfcol = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1))

## convert Date and Time to Date/Time, convert Global active to numeric
DateTime <- with(dfSub, ymd(Date) + hms(Time))
dfSub <- cbind(dfSub, DateTime)
dfSub$Global_active_power <- as.numeric(as.character(dfSub$Global_active_power))

## convert subs to numeric
dfSub$Sub_metering_1 <- as.numeric(as.character(dfSub$Sub_metering_1))
dfSub$Sub_metering_2 <- as.numeric(as.character(dfSub$Sub_metering_2))
dfSub$Sub_metering_3 <- as.numeric(as.character(dfSub$Sub_metering_3))

#plot
plot((dfSub$DateTime), dfSub$Sub_metering_1, type ="n", xlab = " ", ylab = "Energy sub metering")
lines(as.numeric(dfSub$DateTime), dfSub$Sub_metering_1, col="black")
lines(as.numeric(dfSub$DateTime), dfSub$Sub_metering_2, col="red")
lines(as.numeric(dfSub$DateTime), dfSub$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       pch = c(95, 95, 95), col = c("black", "red", "blue"))
#save plot3
dev.copy(png,"plot3.png", width = 480, height = 480, units = "px")
dev.off()
