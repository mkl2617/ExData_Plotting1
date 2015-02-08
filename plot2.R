dataset<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
dataset[dataset=="?"]=NA
dataset$Date<-strptime(as.character(dataset$Date), "%d/%m/%Y")
subset<-dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

subset$Rtime<-paste(subset$Date, subset$Time)
subset$Rtime<-strptime(as.character(subset$Rtime), "%Y-%m-%d %H:%M:%S")

#plot2 - LINE CHART #1

png(file="plot2.png",width=480,height=480)

subset$Global_active_power<-as.character(subset$Global_active_power)
subset$Global_active_power<-as.numeric(subset$Global_active_power)
plot(subset$Rtime,subset$Global_active_power,
     type="n",
     xlab="",
     ylab="Global Active Power (kilowatts)")
lines(subset$Rtime,subset$Global_active_power)

dev.off()