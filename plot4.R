plot4 <- function()
  
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
  png("plot4.png",height = 480, width = 480)
  
  ##Divide device in 4 parts (to be filled row-wise)
  par(mfrow=c(2,2))
  
  ## Plot Active Power
  plot(Global_active_power ~ DateAndTime,data = Req_data,xlab="",ylab = "Global Active Power",type="n")
  lines(Global_active_power ~ DateAndTime,data = Req_data)
 
  ## Plot Voltage
  plot( Voltage ~ DateAndTime,data = Req_data,xlab="datetime",ylab = "Voltage",type="n")
  lines(Voltage ~ DateAndTime,data = Req_data)
  
  ## Plot sub metering along with legend
  plot( Req_data$DateAndTime , Req_data$Sub_metering_1, ylab="Energy sub metering" ,xlab = "",type = "n")
  lines( Req_data$DateAndTime , Req_data$Sub_metering_1,col="black")
  lines( Req_data$DateAndTime , Req_data$Sub_metering_2,col="red")
  lines( Req_data$DateAndTime , Req_data$Sub_metering_3,col="blue")
  legend("topright",pch = "-" ,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
 
   ## Plot Reactive power
  plot( Global_reactive_power ~ DateAndTime,data = Req_data,xlab="datetime",ylab = "Global_reactive_power",type="n")
  lines(Global_reactive_power ~ DateAndTime,data = Req_data)
  
  ##Close png device
  dev.off()
  
}