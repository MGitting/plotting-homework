#preprocessing data
library(lubridate)
library(dplyr)
d <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
cDate <- as.character(d$Date)
dDate <- dmy(cDate)
d <- d %>% mutate(Date=dDate)
ad <- d %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot 2
Date <- ad$Date
Time <- ad$Time
NewTime <- paste(Date,Time)
NewTime <- ymd_hms(NewTime)
GAP <- as.numeric(ad$Global_active_power)
plot(NewTime,GAP,type="l",xlab = "",ylab = "Global Active Power (kilowatts)",yaxt="n")
axis(2,at = c(0,1000,2000,3000),labels = c(0,2,4,6))
dev.copy(png,"plot2.png")
dev.off()
