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


#PLOT 1
#Draw Histogram Global Active Power
hist(epcc$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()