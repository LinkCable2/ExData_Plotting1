# Exploratory Data Analysis: Course Project 1
  
#Plot 1

    #Reading Data
    if (!file.exists("household_power_consumption.txt")){unzip("exdata_data_household_power_consumption.zip")}
    hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
    
    #Converting Date and Time to Date and POSIXlt and POSIXct objects
    hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
    hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")
    
    #Getting only values from 2007-02-01 to 2007-02-02
    hpc <- hpc[hpc$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]
    
    #Making the plot1
    png(filename = "plot1.png")
    hist(hpc$Global_active_power, col = "RED", 
                                  main = "Global Active Power", 
                                  xlab = "Global Active Power (kilowatts)")
    dev.off()
    