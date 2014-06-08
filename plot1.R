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

png("plot1.png",
    width = 480, height = 480)

hist(db$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()