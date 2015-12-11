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


#PLOT 4

#open PNG graphic device for proper rendering in file of graphics
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2), mar = c(5,4,3,2))


#Subplot 1
with(epcc, plot(DateTime,Global_active_power, type="l", xlab = "",ylab="Global Active Power"))

#Subplot 2
with(epcc, plot(DateTime,Voltage, type="l", xlab = "Date and Time",ylab="Voltage"))

#Subplot 3
with(epcc, plot(DateTime,Sub_metering_1,type="l", xlab = "",ylab="Energy sub metering"))
with(epcc, lines(DateTime, Sub_metering_2, col="red"))
with(epcc, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright",c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"),border = 0)

#Subplot 4
with(epcc, plot(DateTime,Global_reactive_power, type="l", xlab = "Date and Time",ylab="Global Reactive Power"))

#dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()





