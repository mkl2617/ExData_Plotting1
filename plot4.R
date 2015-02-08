dataset<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
dataset[dataset=="?"]=NA
dataset$Date<-strptime(as.character(dataset$Date), "%d/%m/%Y")
subset<-dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

subset$Rtime<-paste(subset$Date, subset$Time)
subset$Rtime<-strptime(as.character(subset$Rtime), "%Y-%m-%d %H:%M:%S")

#plot4 - TIERED GRAPHS
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2), mar=c(5,4,2,1))

subset$Global_active_power<-as.character(subset$Global_active_power)
subset$Global_active_power<-as.numeric(subset$Global_active_power)
plot(subset$Rtime,subset$Global_active_power,
     type="n",
     xlab="",
     ylab="Global Active Power")
lines(subset$Rtime,subset$Global_active_power)

subset$Voltage<-as.character(subset$Voltage)
subset$Voltage<-as.numeric(subset$Voltage)
plot(subset$Rtime,subset$Voltage,
     type="n",
     xlab="datetime",
     ylab="Voltage")
lines(subset$Rtime,subset$Voltage)

subset$Sub_metering_1<-as.character(subset$Sub_metering_1)
subset$Sub_metering_1<-as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2<-as.character(subset$Sub_metering_2)
subset$Sub_metering_2<-as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3<-as.character(subset$Sub_metering_3)
subset$Sub_metering_3<-as.numeric(subset$Sub_metering_3)
plot(subset$Rtime,subset$Sub_metering_1,
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(subset$Rtime,subset$Sub_metering_1)
lines(subset$Rtime,subset$Sub_metering_2, col="red")
lines(subset$Rtime,subset$Sub_metering_3, col="blue")
legend(x="topright",
	 legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	 col=c("black","red","blue"), lty=c(1,1,1),bty="n")

subset$Global_reactive_power<-as.character(subset$Global_reactive_power)
subset$Global_reactive_power<-as.numeric(subset$Global_reactive_power)
plot(subset$Rtime,subset$Global_reactive_power,
     type="n",
     xlab="datetime",
     ylab="Global_reactive_power")
lines(subset$Rtime,subset$Global_reactive_power)

dev.off()