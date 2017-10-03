#DATA LOADING

#Get the data from file
setwd("C:\\R\\XDA")
epc <- read.csv(file = "household_power_consumption.txt",sep = ";",header = TRUE)

#Select only dates:
library("dplyr")
epcc <- filter(epc, Date == "1/2/2007" | Date =="2/2/2007")

#Put factors to dates and numeric
epcc$Date <- as.Date(epcc$Date, format = "%d/%m/%Y")
epcc$Global_active_power <- as.numeric(as.character(epcc$Global_active_power))
epcc["DateTime"] <- as.POSIXct(paste(epcc$Date,epcc$Time), format ="%Y-%m-%d %H:%M:%S")
epcc$Sub_metering_1 <- as.numeric(as.character(epcc$Sub_metering_1))
epcc$Sub_metering_2 <- as.numeric(as.character(epcc$Sub_metering_2))
epcc$Sub_metering_3 <- as.numeric(as.character(epcc$Sub_metering_3))
epcc$Voltage <- as.numeric(as.character(epcc$Voltage))
epcc$Global_reactive_power <- as.numeric(as.character(epcc$Global_reactive_power))


#PLOT 3
#open PNG graphic device for proper rendering in file of graphics
png(filename = "plot3.png",width = 480, height = 480)

with(epcc, plot(DateTime,Sub_metering_1,type="l", xlab = "",ylab="Energy sub metering"))
with(epcc, lines(DateTime, Sub_metering_2, col="red"))
with(epcc, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright",c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))

# Copy did not work propery while saing to PNG
#dev.copy(png, "plot3.png", width = 480, height = 480, res=120)

dev.off()
 





