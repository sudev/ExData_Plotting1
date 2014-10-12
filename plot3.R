# Get required data from dataset 
source("./getdata.R")
data <- getdata() 

with(data, {
  png(filename = "plot3.png")
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  lines(x, data$Sub_metering_1, col = "black")
  lines(x, data$Sub_metering_2, col = "red")
  lines(x, data$Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.off()
})