Elec <- read.table('household_power_consumption.txt',sep = ';',header = T)

require(lubridate)
electr <- Elec[((Elec$Date=='1/2/2007') | (Elec$Date=='2/2/2007')),]

electr$Date <- as.Date(parse_date_time(electr$Date,'dmy'))
electr$Time <- strptime(electr$Time, format = '%H:%M:%S')
electr[1:1440,'Time'] <- format(electr[1:1440,'Time'], '2007-02-01 %H:%M:%S')
electr[1441:2880,'Time'] <- format(electr[1441:2880,'Time'], '2007-02-02 %H:%M:%S')

png('plot4.png',width = 480,height = 480)
par(mfrow=c(2,2))

# plot1
plot(electr$Time,electr$Global_active_power, 
     type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')

# plot2
plot(electr$Time,electr$Voltage, type = 'l',xlab = 'datetime',ylab = 'Voltage')

# plot3
plot(electr$Time,electr$Sub_metering_1, col = 'black', type = 'l',
     xlab = '',ylab = 'Energy sub metering')
points(electr$Time,electr$Sub_metering_2, col = 'red', type = 'l')
points(electr$Time,electr$Sub_metering_3, col = 'blue', type = 'l')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),
       lty = 1,bty = 'n')
#plot4
plot(electr$Time,electr$Global_reactive_power,xlab = 'datatime',ylab = 'Global_reactive_power',
     type = 'l')
dev.off()




