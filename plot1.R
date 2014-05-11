
filename <- "household_power_consumption.txt"

power_data <- read.table(filename, header = TRUE, sep = ";", colClasses = "character")

filtered_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480, bg = "white")

filtered_data$Global_active_power <- sapply(filtered_data$Global_active_power, as.numeric)

hist(filtered_data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", 
     col = "red")

dev.off()

