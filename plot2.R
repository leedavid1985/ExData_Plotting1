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

onlythese$dayofweek <- as.character(weekdays(onlythese$datetime))
plot(onlythese$dayofweek, onlythese$Global_active_power) 
