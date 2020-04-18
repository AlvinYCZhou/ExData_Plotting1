install.packages("purrr")
library(purrr)

# Download and unzip the raw data
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"data.zip","curl")
unzip("data.zip")
data=read.delim("./household_power_consumption.txt",header=T,sep=";",stringsAsFactors=F)
data$Date=as.Date(strptime(data$Date,format="%d/%m/%Y"))

# Trim, trasform and keep target data
obyear=as.Date(c("2007-1-31","2007-2-3"))
data=subset(data,Date>obyear[1],select=Date:Sub_metering_3)
data=subset(data,Date<obyear[2],select=Date:Sub_metering_3)
data$Global_active_power=as.numeric(data$Global_active_power)
# save the data for following ploting
write.table(data, file="household_power_consumption_2017.txt",sep=";")

# Now let's make the 1st graph and store it in Plot 1.png
png(filename = "./Plot 1.png",width = 480, height = 480, units = "px")

hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")

dev.off()

rm(list=ls())