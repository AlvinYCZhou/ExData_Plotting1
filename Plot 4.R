# Read the target data
data=read.delim("./household_power_consumption_2017.txt",header=T,sep=";",
                stringsAsFactors=F)

# Now let's make the 2nd graph and store it in Plot 2.png
png(filename = "./Plot 4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))
# Plot topleft graph
plot(1:nrow(data),data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",xaxt="n")
axis(1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))
# Plot topright graph
plot(1:nrow(data),data$Voltage,xlab="datetime",ylab="Voltage",type="l",xaxt="n")
axis(1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))
# Plot bottomleft graph
plot(1:nrow(data),data$Sub_metering_1,xlab="",ylab="Global Active Power (kilowatts)",col="black",type="l",xaxt="n")
lines(1:nrow(data),data$Sub_metering_2,xlab="",ylab="",col="red",type="l",xaxt="n")
lines(1:nrow(data),data$Sub_metering_3,xlab="",ylab="",col="blue",type="l",xaxt="n")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=c(1,1,1),lty=c(1,1,1))
axis(1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))
# Plot bottomright graph
plot(1:nrow(data),data$Global_active_power,xlab="datetime",ylab="Global Active Power",type="l",xaxt="n")
axis(1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))

dev.off()

rm(list=ls())