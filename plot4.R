setwd("/Users/lizard0827/Desktop/class/Exploratory data/")
power_data<-read.csv("household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=F)
power_data$Date<-as.Date(power_data$Date, format="%d/%m/%Y")
subpower<-subset(power_data, subset=(Date >="2007-02-01" & Date <="2007-02-02"))
Datetime<-paste(subpower$Date, subpower$Time, sep=" ")
subpower$Datetime<-as.POSIXct(Datetime)
par(mfrow=c(2,2))
with(subpower, {plot(Global_active_power~Datetime, type="l", xlab="Global Active Power")
     plot(Voltage~Datetime, type="l", xlab="datetime", ylab="Voltage")
     plot(Sub_metering_1~Datetime, type="l", xlab="", ylab="Engery sub metering")                
     lines(Sub_metering_2~Datetime, col="red")
     lines(Sub_metering_3~Datetime, col="blue")
     legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
     col=c("black", "red", "blue"), lty=1, lwd=2, bty="o")
     plot(Global_reactive_power~Datetime, type="l", xlab="datetime",
     ylab="Global_reactive_power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
