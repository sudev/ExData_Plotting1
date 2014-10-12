# Get required data from dataset 
source("./getdata.R")
data <- getdata() 

with(data, {
  png(filename = "plot4.png")
  par(mfrow = c(2, 2))
  
  
  # Plot One 
  y <- data$Global_active_power
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, y, type = "l", ylab = "Global Active Power", xlab = "")
  
  #Plot Two 
  y <- data$Voltage
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, y, type = "l", ylab = "Voltage", xlab = "datetime")
  
  #Plot Three
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  lines(x, data$Sub_metering_1, col = "black")
  lines(x, data$Sub_metering_2, col = "red")
  lines(x, data$Sub_metering_3, col = "blue")
  legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  #Plot Four
  y <- data$Global_reactive_power
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, y, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  
  dev.off()
})