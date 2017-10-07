#preprocessing data
library(lubridate)
library(dplyr)
d <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
cDate <- as.character(d$Date)
dDate <- dmy(cDate)
d <- d %>% mutate(Date=dDate)
ad <- d %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot 4
Date <- ad$Date
Time <- ad$Time
NewTime <- paste(Date,Time)
NewTime <- ymd_hms(NewTime)
#4graph
par(mfrow=c(2,2))
#Global_active_power
GAP <- as.numeric(ad$Global_active_power)
plot(NewTime,GAP,type="l",xlab = "",ylab = "Global Active Power (kilowatts)",yaxt="n")
axis(2,at = c(0,1000,2000,3000),labels = c(0,2,4,6))
#Voltage
v <- as.character(ad$Voltage)
vv <- as.numeric(v)
plot(NewTime,vv,xlab = "datetime",ylab = "Voltage",type = "l",yaxt = "n")
axis(2,at=c(234,238,242,246),label=c(234,238,242,246))
#Energy sub metering
s1 <- as.numeric(ad$Sub_metering_1)
s2 <- as.numeric(ad$Sub_metering_2)
s3 <- as.numeric(ad$Sub_metering_3)
plot(NewTime,s1,type="l",col="grey",xlab="",ylab = "Energy sub metering",yaxt="n")
lines(NewTime,s2,col="red")
lines(NewTime,s3,col="blue")
axis(2,at = c(0,10,20,30), label = c(0,10,20,30))
legend("topright",x.intersp = 0.2,y.intersp = 0.8,bty="n",text.width = 90000,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("grey","red","blue"))
#Global_reactive_power
grp <- as.numeric(as.character(ad$Global_reactive_power))
plot(NewTime,grp,xlab = "datetime",ylab = "Global_reactive_power",type = "l",yaxt = "n")
axis(2,at=c(0,0.1,0.2,0.3,0.4,0.5),label=c("0.0",0.1,0.2,0.3,0.4,0.5))
dev.copy(png,"plot4.png")
dev.off()
