# Read the target data
data=read.delim("./household_power_consumption_2017.txt",header=T,sep=";",
                stringsAsFactors=F)

# Now let's make the 2nd graph and store it in Plot 2.png
png(filename = "./Plot 2.png",width = 480, height = 480, units = "px")

plot(1:nrow(data),data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l",xaxt="n")
axis(1,at=c(0,1400,2800),labels=c("Thu","Fri","Sat"))

dev.off()
rm(list=ls())