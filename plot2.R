
# set location to file path
file_path <- "./household_power_consumption.txt"

# read data from file
housing_data <- read.table(file_path, sep=";", header=TRUE)

# retrieve global active power data from selected dates
date_logical <- housing_data$Date == "1/2/2007" | housing_data$Date == "2/2/2007"

date_data <- housing_data[date_logical, c("Date", "Time", "Global_active_power")]
global_active_power <- as.numeric(as.character(date_data$Global_active_power))

datetime <- strptime(paste(date_data$Date, date_data$Time), "%d/%m/%Y %H:%M:%S")


# plot lines
plot(datetime, global_active_power, pch=NA, ylab="Global Active Power (kilowatts)", xlab="") 
lines(datetime, global_active_power) 

dev.copy(png, 'plot2.png')
dev.off()

