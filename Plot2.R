library(lubridate)
library(dplyr)

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>%
    filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = dmy_hms(paste(Date, Time))) %>% tbl_df

# Plot into png
png(file="Plot2.png")
plot(data$datetime, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
