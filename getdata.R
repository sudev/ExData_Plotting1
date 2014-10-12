getdata <- function(){
  path <- getwd()
  if (!file.exists("./dataclean.rdata")) {
  	# Download and unzip the file  
  	file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  	file.name <- file.path(path, "zipdata.zip")
  	download.file(file.url, file.name)
  	# unzip file
  	unzip(file.name)
    # Its faster when you specify the exact data types of each coloumn.   
  	data <- read.table("./household_power_consumption.txt", header = TRUE, 
                       sep = ";", na.strings = "?", colClasses = 
                         c("character", "character", "numeric", "numeric", 
                           "numeric", "numeric", "numeric", "numeric", "numeric"))
    #Convert to R date type 
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
  	data <- subset(data, data$Date == "2007/02/01" | data$Date == "2007/02/02")
    saveRDS(object=data, file= "dataclean.rdata")
    return(data)
  } else { 
    data <- readRDS("./dataclean.rdata")
    return(data)
  }
}