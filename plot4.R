library(dplyr)
library(lubridate)
rm(list = ls())

df <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
# Filter for dates
df <- df %>% filter(as.Date(Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))
df$DateTime <- as.POSIXct(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(df$DateTime, df$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power")

plot(df$DateTime, df$Voltage, type = "line", xlab = "datetime", ylab = "Voltage")

plot(df$DateTime, df$Sub_metering_1, type = "line", col = "black", xlab = "", ylab = "Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", inset = 0.01, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), box.lty = 0)

plot(df$DateTime, df$Global_reactive_power, type = "line", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()