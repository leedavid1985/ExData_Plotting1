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
