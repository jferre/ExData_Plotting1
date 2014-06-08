setwd("C:/Users/James/Documents/GitHub/ExData_Plotting1")

rawdb <- read.table("household_power_consumption.txt",
                    header = T,sep = ";",na.strings = c("NA","?"),
                    colClasses = c("character","character","numeric",
                                   "numeric","numeric","numeric",
                                   "numeric","numeric","numeric"))

rawdb <- rawdb[rawdb$Date %in% c("1/2/2007","2/2/2007"),]

rawdb$DateTime <- paste(rawdb$Date,rawdb$Time)
rawdb$DateTime <- strptime(rawdb$DateTime,"%d/%m/%Y %H:%M:%S")
db <- rawdb

png("plot4.png",
    width = 480, height = 480)

par(mfcol = c(2, 2))

plot(db$DateTime,db$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(db$DateTime,db$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(db$DateTime,db$Sub_metering_2,col = "red")
lines(db$DateTime,db$Sub_metering_3,col = "blue")
legend("topright", lty = c(1,1,1), col = c("black","red","blue"),
       bty = "n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(db$DateTime,db$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(db$DateTime,db$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()