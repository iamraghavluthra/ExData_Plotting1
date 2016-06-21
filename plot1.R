plot1 <- function()
  
{ ##Load grDevice library for saving to PNG
  
  library("grDevices")
  
  ## Read file from current working directory
  Main_data <- read.table("household_power_consumption.txt",sep = ";" , na.strings="?", header = TRUE)
  
  ## Converting into POSIXlt/POSIXct 
  DateAndTime <- strptime(paste(Main_data$Date,Main_data$Time),"%d/%m/%Y %H:%M:%S")
  
  ## Create a well defined Data and Time Column
  Main_data <- cbind(Main_data,DateAndTime)
  
  ##Required Data
  Req_data <- subset(Main_data,Main_data$DateAndTime >= "2007-02-01" & Main_data$DateAndTime < "2007-02-03")
  
  ##Explicity only Bitmapped png device
  png("plot1.png",height = 480, width = 480)
  
  ##Make histogram
  hist(Req_data$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col="red")

  ##Close png device
  dev.off()
  }