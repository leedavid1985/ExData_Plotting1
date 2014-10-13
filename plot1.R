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