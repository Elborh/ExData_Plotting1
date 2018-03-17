library(lubridate)
library(dplyr)

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>%
    filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>% tbl_df

# Plot into png
png(file="Plot3.png")

with(data, {
    plot(datetime, Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "")
    points(datetime, Sub_metering_1, type="l", col="black")
    points(datetime, Sub_metering_2, type="l", col="red")
    points(datetime, Sub_metering_3, type="l", col="blue")
})
legend("topright", col=c("black", "blue", "red"), legend=c("Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()
