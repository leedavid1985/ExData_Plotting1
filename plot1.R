<<<<<<< HEAD
##Reads in data
setwd("C:/Users/David/Desktop") 
mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)
mydata2 <- mydata

##Only grab dates from Feb 1 and 2, 2007
mydata2$Date <- as.character(mydata2$Date)
onlythese <-subset(mydata2,Date=="1/2/2007" | Date=="2/2/2007")

##Make histogram for Plot1
png(file="plot1.png") ##Opens png device before plotting
hist(onlythese$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()
=======
setwd("C:/Users/David/Desktop") ##Reads in data
mydata <- read.table("./household_power_consumption.txt",sep=";",header=TRUE)
mydata2 <- mydata
mydata2$datetime <- as.POSIXct(paste(mydata2$Date, mydata2$Time), format="%d/%m/%Y %H:%M:%S")  ##Combines date and time

onlythese <- subset(mydata2,Date=="2/1/2007" | Date=="2/2/2007") ##Takes only dates I want
onlythese$Global_active_power <- as.character(onlythese$Global_active_power)
onlythese$Global_active_power <- as.numeric(onlythese$Global_active_power)  ##Makes readable

png(file="plot1.png") ##Opens png device before plotting
hist(onlythese$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()

onlythese$dayofweek <- weekdays(onlythese$datetime)
plot(onlythese$datetime, onlythese$Global_active_power) 
>>>>>>> e4e44f81ae813d1b590148904a87609d1f0c142c
