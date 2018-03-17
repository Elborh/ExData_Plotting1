library(lubridate)
library(dplyr)

# Load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE) %>%
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        mutate(datetime = dmy_hms(paste(Date, Time))) %>% tbl_df

# Plot into png
png(file="Plot1.png", bg = "transparent")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
