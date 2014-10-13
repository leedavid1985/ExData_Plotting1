##Reads in data
setwd("C:/Users/David/Desktop") 
mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)
mydata2 <- mydata

##Only grab dates from Feb 1 and 2, 2007
mydata2$Date <- as.character(mydata2$Date)
onlythese <-subset(mydata2,Date=="1/2/2007" | Date=="2/2/2007")

##Combines date and time for Plot2
onlythese$datetime <- as.POSIXct(paste(onlythese$Date, onlythese$Time), format="%d/%m/%Y %H:%M:%S")
onlythese$Global_active_power <- as.character(onlythese$Global_active_power)
onlythese$Global_active_power <- as.numeric(onlythese$Global_active_power)  ##Makes readable
onlythese$Sub_metering_1 <- as.numeric(onlythese$Sub_metering_1)
onlythese$Sub_metering_2 <- as.numeric(onlythese$Sub_metering_2)
onlythese$Sub_metering_3 <- as.numeric(onlythese$Sub_metering_3)

##Make Plot3
png(file="plot3.png") ##Opens png device before plotting
yrange <- range(c(onlythese$Sub_metering_1,onlythese$Sub_metering_2,onlythese$Sub_metering3))
plot(onlythese$datetime, onlythese$Sub_metering_1,type="l", ylab="Global Active Power (kilowatts)",xlab="",ylim=yrange) 
lines(onlythese$datetime,onlythese$Sub_metering_2,type="l",col="red")
lines(onlythese$datetime,onlythese$Sub_metering_3,type="l",col="blue")
legend("topright",lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"))
dev.off()
