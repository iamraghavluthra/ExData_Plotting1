plot2 <- function()
  
{ 
  ##Load grDevice library for saving to PNG
  
  library("grDevices")
  
  ## Read file from current working directory
  Main_data <- read.table("household_power_consumption.txt",sep = ";" , na.strings="?",header = TRUE)
  
  ## Converting into POSIXlt/POSIXct 
  DateAndTime <- strptime(paste(Main_data$Date,Main_data$Time),"%d/%m/%Y %H:%M:%S")
  
  ## Create a well defined Data and Time Column
  
  Main_data <- cbind(Main_data,DateAndTime)
  
  ##Required Data
  Req_data <- subset(Main_data,Main_data$DateAndTime >= "2007-02-01" & Main_data$DateAndTime < "2007-02-03")
  
  ##Explicity only Bitmapped png device
  png("plot2.png",height = 480, width = 480)
  
  ## Initialize the plot
  plot(Global_active_power ~ DateAndTime,data = Req_data,xlab="",ylab = "Global Active Power (kilowatts)",type="n")
  
  ## Draw lines
  lines(Global_active_power ~ DateAndTime,data = Req_data)
  
  ##Close png device
  dev.off()
}