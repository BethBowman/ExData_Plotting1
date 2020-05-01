## Read in file and subset relevant data

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(strptime(df$Date, format = "%d/%m/%Y"))
dfSub <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )


## prep window
par(mfcol = c(1, 1), mar = c(5.1, 4.1, 4.1, 2.1))


## plot 2
## convert Date and Time to Date/Time, convert Global active to numeric
DateTime <- with(dfSub, ymd(Date) + hms(Time))
dfSub <- cbind(dfSub, DateTime)
dfSub$Global_active_power <- as.numeric(as.character(dfSub$Global_active_power))
#plot
plot((dfSub$DateTime), as.numeric(dfSub$Global_active_power), type ="n", xlab = " ", ylab = "Global Active Power (kilowats)")
lines(as.numeric(dfSub$DateTime), as.numeric(dfSub$Global_active_power))
#save plot2
dev.copy(png,"plot2.png", width = 480, height = 480, units = "px")
dev.off()
