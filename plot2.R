
## Load data into R
    dataset <- read.csv("household_power_consumption.txt", 
                    header=TRUE, na.strings = "?", sep=";", nrows=2075259)

## turn date into new as.date format
    dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## Subset data 2-day period in February, 2007 for exploratory analysis
    sub_data <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
        rm(dataset)

## Convert time and date using strptime() and as.Date() functions
    date_time <- paste(as.Date(sub_data$Date), sub_data$Time)
    sub_data$Date_time <- as.POSIXct(date_time)

## Second plot; plot for Global active power by date and time
    plot(sub_data$Global_active_power ~ sub_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save plot to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()