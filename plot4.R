
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

## fourth plot; 4 plots for sub metering, voltage, & global active power
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(sub_data, {
        plot(Global_active_power ~ Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage ~ Date_time, type="l",
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1 ~ Date_time, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ Date_time,col='Red')
        lines(Sub_metering_3 ~ Date_time,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Date_time, type="l",
             ylab="Global Rective Power (kilowatts)",xlab="")
    })
    
## Save plot to PNG
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()