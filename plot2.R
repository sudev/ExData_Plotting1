# Get required data from dataset 
source("./getdata.R")
data <- getdata() 

# plot2
with(data, {
  png(filename = "plot2.png")
  y <- data$Global_active_power
  x <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
  plot(x, y, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  dev.off()
})

