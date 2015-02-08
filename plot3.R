dataset<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
dataset[dataset=="?"]=NA
dataset$Date<-strptime(as.character(dataset$Date), "%d/%m/%Y")
subset<-dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

subset$Rtime<-paste(subset$Date, subset$Time)
subset$Rtime<-strptime(as.character(subset$Rtime), "%Y-%m-%d %H:%M:%S")

#plot3 - LINE CHART #2
png(file="plot3.png",width=480,height=480)

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
	 col=c("black","red","blue"), lty=c(1,1,1))

dev.off()