# Reading the data 

bigdata <- read.table("household_power_consumption.txt", header=T, sep=';', 
                     na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# subsetting the data

Data <- bigdata[bigdata$Date %in% c("1/2/2007","2/2/2007") ,]
# Creating the plot

hist(Data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Saving to the file with the desired size

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
