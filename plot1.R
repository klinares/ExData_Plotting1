
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
    
## First plot; histogram for Global active power
    hist(sub_data$Global_active_power, main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
    
## Save hist as PNG
    dev.copy(png, file="plot1.png", height=480, width=480)
    dev.off()