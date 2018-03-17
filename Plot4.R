library(lubridate)
library(dplyr)

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>%
    filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>% tbl_df

# Plot into png file device
png(file="Plot4.png")
par(mfrow=c(2,2))

with(data, {
    plot(datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
    plot(datetime, Voltage, type="l", ylab = "Voltage", xlab = "datetime")
    
    plot(datetime, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
    points(datetime, Sub_metering_1, type="l", col="black")
    points(datetime, Sub_metering_2, type="l", col="red")
    points(datetime, Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black", "blue", "red"), legend=c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3"), lwd = 1, bty="n")
    
    plot(datetime, Global_reactive_power, type="l")
})

dev.off()
