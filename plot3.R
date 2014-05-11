
filename <- "household_power_consumption.txt"

power_data <- read.table(filename, header = TRUE, sep = ";", na.strings = "?", colClasses = "character")

filtered_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot3.png", width = 480, height = 480, bg = "white")

filtered_data$Sub_metering_1 <- sapply(filtered_data$Sub_metering_1, as.numeric)
filtered_data$Sub_metering_2 <- sapply(filtered_data$Sub_metering_2, as.numeric)
filtered_data$Sub_metering_3 <- sapply(filtered_data$Sub_metering_3, as.numeric)
filtered_data$Date_Time <- strptime(paste(filtered_data$Date, filtered_data$Time), format="%d/%m/%Y %H:%M:%S")

plot (filtered_data$Date_Time, filtered_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(filtered_data$Date_Time, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$Date_Time, filtered_data$Sub_metering_3, col = "blue")

legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
