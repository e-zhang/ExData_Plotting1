
# set location to file path
file_path <- "./household_power_consumption.txt"

# read data from file
housing_data <- read.table(file_path, sep=";", header=TRUE)

# retrieve global active power data from selected dates
date_logical <- housing_data$Date == "1/2/2007" | housing_data$Date == "2/2/2007"

date_data <- housing_data[date_logical, c("Date", "Time", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3", "Global_active_power", "Global_reactive_power", "Voltage")]
datetime <- strptime(paste(date_data$Date, date_data$Time), "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(as.character(date_data$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(date_data$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(date_data$Sub_metering_3))

global_active_power <- as.numeric(as.character(date_data$Global_active_power))
global_reactive_power <- as.numeric(as.character(date_data$Global_reactive_power))
voltage <- as.numeric(as.character(date_data$Voltage))


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plot at (0,0)
plot(datetime, global_active_power, pch=NA, ylab="Global Active Power", xlab="", type="l") 

# plot at (0, 1)
plot(datetime, voltage, type="l", ylab="Voltage", xlab="datetime")

# plot at (1,0)
plot(datetime, sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(datetime, sub_metering_2, col="red")
lines(datetime, sub_metering_3, col="blue")
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, bty="n", col=c('black', 'red', 'blue')) 

# plot at (1,1)
plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
