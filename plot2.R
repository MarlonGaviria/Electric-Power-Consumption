Elec <- read.table('household_power_consumption.txt',sep = ';',header = T)

require(lubridate)
electr <- Elec[((Elec$Date=='1/2/2007') | (Elec$Date=='2/2/2007')),]

electr$Date <- as.Date(parse_date_time(electr$Date,'dmy'))


electr$Time <- strptime(electr$Time, format = '%H:%M:%S')
electr[1:1440,'Time'] <- format(electr[1:1440,'Time'], '2007-02-01 %H:%M:%S')
electr[1441:2880,'Time'] <- format(electr[1441:2880,'Time'], '2007-02-02 %H:%M:%S')

png('plot2.png',width = 480,height = 480)
plot(electr$Time,electr$Global_active_power, 
     type = 'l',xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.off()
