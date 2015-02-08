dataset<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
dataset[dataset=="?"]=NA
dataset$Date<-strptime(as.character(dataset$Date), "%d/%m/%Y")
subset<-dataset[dataset$Date>="2007-02-01" & dataset$Date<="2007-02-02",]

subset$Rtime<-paste(subset$Date, subset$Time)
subset$Rtime<-strptime(as.character(subset$Rtime), "%Y-%m-%d %H:%M:%S")

#plot1 - HISTOGRAM

png(file="plot1.png",width=480,height=480)

subset$Global_active_power<-as.character(subset$Global_active_power)
subset$Global_active_power<-as.numeric(subset$Global_active_power)
hist(subset$Global_active_power, 
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     main="Global Active Power")

dev.off()