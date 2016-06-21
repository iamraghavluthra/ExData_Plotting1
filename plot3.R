plot3 <- function()
  
{ ##Load grDevice library for saving to PNG
  
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
  png("plot3.png",height = 480, width = 480)
  
  ##Initialize the plot
  plot( Req_data$DateAndTime , Req_data$Sub_metering_1, ylab="Energy sub metering" ,xlab = "",type = "n")

  ## Plot the lines
  lines( Req_data$DateAndTime , Req_data$Sub_metering_1,col="black")
  lines( Req_data$DateAndTime , Req_data$Sub_metering_2,col="red")
  lines( Req_data$DateAndTime , Req_data$Sub_metering_3,col="blue")
  
  ## Adding legend
  legend("topright",pch = "-" ,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ##Close png device
  dev.off()
  
  
}