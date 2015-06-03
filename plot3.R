# Reading the data 

bigdata <- read.table("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data

Data <- bigdata[bigdata$Date %in% c("1/2/2007","2/2/2007") ,]


# Pasting Date & time and converting the result

datime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Creating the plot and adding the different data and legends

png("plot3.png", width=480, height=480)
plot(datime, Data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datime, Data$Sub_metering_2, type="l", col="red")
lines(datime, Data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
