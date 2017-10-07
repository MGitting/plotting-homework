#preprocessing data
library(lubridate)
library(dplyr)
d <- read.table("1.txt",header=TRUE,sep=";")
cDate <- as.character(d$Date)
dDate <- dmy(cDate)
d <- d %>% mutate(Date=dDate)
ad <- d %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot 3
Date <- ad$Date
Time <- ad$Time
NewTime <- paste(Date,Time)
NewTime <- ymd_hms(NewTime)
s1 <- as.numeric(ad$Sub_metering_1)
s2 <- as.numeric(ad$Sub_metering_2)
s3 <- as.numeric(ad$Sub_metering_3)
plot(NewTime,s1,type="l",col="grey",xlab="",ylab = "Energy sub metering",yaxt="n")
lines(NewTime,s2,col="red")
lines(NewTime,s3,col="blue")
axis(2,at = c(0,10,20,30), label = c(0,10,20,30))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1, col = c("grey","red","blue"))
dev.copy(png,"plot3.png")
dev.off()
