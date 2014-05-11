
filename <- "household_power_consumption.txt"

power_data <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", colClasses = "character")

filtered_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot2.png", width = 480, height = 480, bg = "white")

filtered_data$Global_active_power <- sapply(filtered_data$Global_active_power, as.numeric)
filtered_data$Date_Time <- strptime(paste(filtered_data$Date, filtered_data$Time), format = "%d/%m/%Y %H:%M:%S")

plot(filtered_data$Date_Time, filtered_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
	 
dev.off()
