# Reading the data 

bigdata <- read.table("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data

Data <- bigdata[bigdata$Date %in% c("1/2/2007","2/2/2007") ,]


# Pasting Date & time and converting the result

datime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Creating the plot and saving into a file
png("plot2.png", width=480, height=480)
plot(datime, Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
