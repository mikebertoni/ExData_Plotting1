rawdata<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?",stringsAsFactors = FALSE)
mydata<-subset(rawdata,Date=="1/2/2007" | Date=="2/2/2007")
mydata$DateAndTime<-with(mydata,paste(Date,Time))
mydata$DateAndTime<-strptime(mydata$DateAndTime, format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2,2))
with(mydata, {
        #1
        plot(DateAndTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        #2
        plot(DateAndTime,Voltage,type="l",xlab="datetime",ylab="Voltage")
        #3
        plot(DateAndTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(DateAndTime,Sub_metering_2,col="red")
        lines(DateAndTime,Sub_metering_3,col="blue")
        legend("topright",col=c("black","red","blue"),lwd=1,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        #4
        plot(DateAndTime,Global_reactive_power,type="l",xlab="datetime")
})
dev.off()
