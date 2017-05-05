# Exploratory Data Analysis: Course Project 1

#Plot 4

    #Reading Data
    if (!file.exists("household_power_consumption.txt")){unzip("exdata_data_household_power_consumption.zip")}
    hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
    
    #Converting Date and Time to Date and POSIXlt and POSIXct objects
    hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
    hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")
    
    #Getting only values from 2007-02-01 to 2007-02-02
    hpc <- hpc[hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
    hpc$Time <- as.POSIXct(paste(hpc$Date, format(hpc$Time, "%H:%M:%S")))
    
    #Making the plot4
    png(filename = "plot4.png")
    par(mfrow = c(2,2))
    
    #plot4.1
    plot(hpc$Time, hpc$Global_active_power, type="l",xlab = "",ylab="Global Active Power (kilowatts)")
    
    #plot4.2
    plot(hpc$Time, hpc$Voltage, type="l",xlab = "datetime",ylab="Voltage")
    
    #plot4.3
    plot(hpc$Time, hpc$Sub_metering_1, type = "l", xlab = "", ylab= "Energy sub metering")
    lines(hpc$Time, hpc$Sub_metering_2, type = "l", col = "RED")
    lines(hpc$Time, hpc$Sub_metering_3, type = "l", col = "BLUE")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))
    
    #plot4.4
    plot(hpc$Time, hpc$Global_reactive_power, type="l",xlab = "datetime",ylab="Global_reactive_power")
    
    dev.off()