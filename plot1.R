#preprocessing data
library(lubridate)
library(dplyr)
d <- read.table("1.txt",header=TRUE,sep=";")
cDate <- as.character(d$Date)
dDate <- dmy(cDate)
d <- d %>% mutate(Date=dDate)
ad <- d %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

#plot 1
GAP <- as.numeric(ad$Global_active_power)
hist(GAP,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red",xaxt = "n",breaks = seq(0,3800,250))
axis(1,at = c(0,1000,2000,3000),labels=c("0","2","4","6"))
dev.copy(png,"plot1.png")
dev.off()
