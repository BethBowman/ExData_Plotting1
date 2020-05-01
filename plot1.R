## Read in file and subset relevant data

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))
dfSub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )


## prep window
par(mfcol = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1))

## plot 1
hist(as.numeric(dfSub$Global_active_power), col="red", xlab = "Global Active Power(kilowatts)", 
     ylab ="Frequency", main ="Global Active Power", breaks = 15)
#save plot1
dev.copy(png,"plot1.png", width = 480, height = 480, units = "px")
dev.off()
