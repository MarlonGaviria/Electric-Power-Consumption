Elec <- read.table('household_power_consumption.txt',sep = ';',header = T)


electr <- Elec[((Elec$Date=='1/2/2007') | (Elec$Date=='2/2/2007')),]
names(electr)


hist(as.numeric(electr$Global_active_power),
     col = 'red', xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Active Power')
