# Get required data from dataset 
source("./getclean.R")
data <- getdata() 
# Plot 
with(data, {
  png(filename = "plot1.png")
  hist(data$Global_active_power, main = "Global Active Power", 
       col = "red",  xlab = "Global Active Power (kilowatts)")
  dev.off()
})

