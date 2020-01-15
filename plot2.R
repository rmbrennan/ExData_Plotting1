library(dplyr)
library(lubridate)
rm(list = ls())

df <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
# Filter for dates
df <- df %>% filter(as.Date(Date, format = "%d/%m/%Y") %in% as.Date(c("2007-02-01", "2007-02-02")))
df$DateTime <- as.POSIXct(strptime(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S"))

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(df$DateTime, df$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
