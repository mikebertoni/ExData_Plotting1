rawdata<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?",stringsAsFactors = FALSE)
mydata<-subset(rawdata,Date=="1/2/2007" | Date=="2/2/2007")
mydata$DateAndTime<-with(mydata,paste(Date,Time))
mydata$DateAndTime<-strptime(mydata$DateAndTime, format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
with(mydata, {
    plot(DateAndTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
})
dev.off()
