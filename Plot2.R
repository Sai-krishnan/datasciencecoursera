## Read the entire file into R from working directory
PowCons <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

y <- as.POSIXct(paste(PowCons$Date, PowCons$Time), format = "%d/%m/%Y %T")
DateTime = data.frame(DateTime = as.POSIXct(y))
PowCons1 <- PowCons[,3:9]
HPC <- cbind(DateTime,PowCons1)

##Extract records corresponding to the 1st and 2nd of February 2007
library(lubridate)
date1 <- as.POSIXct("2007-02-01 00:00:00")
date2 <- as.POSIXct("2007-02-02 23:59:59")
int <- new_interval(date1, date2)
HPC1 <- HPC[HPC$DateTime %within% int,]

##Extract the day of week to create a new column for Plot 2 to 4
DayofWeek <- wday(HPC1$DateTime, label=TRUE)
DayofWeek = data.frame(DayofWeek = as.character(DayofWeek))
HPC1 <- cbind(DayofWeek,HPC1)

##Create Plot 2
plot(HPC1$DateTime,as.numeric(as.character(HPC1$Global_active_power)),type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

##Write to PNG file 
dev.copy(png, file = "Plot2.png")
dev.off()

## End