
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

## Third plot; plot for sub metering by date and time & global active power
    with(sub_data, {
        plot(Sub_metering_1 ~ Date_time, type="l",
            ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Date_time,col='Red')
        lines(Sub_metering_3~Date_time,col='Blue')
    })
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
## Save plot to PNG
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()