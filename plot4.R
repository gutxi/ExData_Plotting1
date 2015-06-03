# Reading the data 

bigdata <- read.table("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data

Data <- bigdata[bigdata$Date %in% c("1/2/2007","2/2/2007") ,]


# Pasting Date & time and converting the result

datime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# Creating the order of the plots

par(mfrow= c(2,2))

#Creating the file
png("plot4.png", width=480, height=480)

# Creating the order of the plots

par(mfrow= c(2,2))

#Plot 1,1
plot(datime, Data$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

#plot 1,2

plot(datime, Data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot2,1

plot(datime, Data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datime, Data$Sub_metering_2, type="l", col="red")
lines(datime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Plot 2,2

plot(datime, Data$Global_reactive_power, type="l", xlab ="datetime", 
     ylab ="Global_reactive_power")

dev.off()
