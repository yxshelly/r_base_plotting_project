## download and read the data
colnames <- c("date", "time", "global_active_power", "global_reactive_power", 
              "voltage", "global_intensity", 
              "sub_metering_1", "sub_metering_2", "sub_metering_3")

data <- read.delim("household_power_consumption.txt", 
                   header = TRUE, 
                   na.strings = "?", 
                   sep = ";", 
                   skip = 66636,
                   nrow = 2879,
                   col.names = colnames)

## briefly look at the data
head(data)
tail(data)
str(data)

## get date+time for later use
library(lubridate)
data$datetime <- paste(data$date, data$time, sep =" ")
data$datetime

# change to date class
data$date_new <- dmy_hms(data$datetime)
class(data$date_new)
str(data$data_new)

## plot 1
png("plot1.png", width=480, height=480)
hist(data$global_active_power, col="red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()












