## Open file in default directory with dot as decimals ##
hhfile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

## extracting only required data ##
hhfile$Time <- strptime(paste(hhfile$Date, hhfile$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
hhfile$Date <- as.Date(hhfile$Date, "%d/%m/%Y")
select <- hhfile$Date == "2007-02-01" | hhfile$Date == "2007-02-02"
household <- hhfile[select,1:9]
household$Global_active_power <- as.numeric(household$Global_active_power)
household$Sub_metering_1 <- as.numeric(household$Sub_metering_1)
household$Sub_metering_2 <- as.numeric(household$Sub_metering_2)
household$Sub_metering_3 <- as.numeric(household$Sub_metering_3)
household$Global_reactive_power <- as.numeric(household$Global_reactive_power)
household$Voltage <- as.numeric(household$Voltage)

## removing loaded data from environment to release memory ##
rm(hhfile)

png(filename = "plot4.png", width = 480, height = 480)

## create 4 graphs into a unique screen ##
par(mfrow = c(2,2))

## plot 1st Graph ##
with(household, plot(Time, Global_active_power/1000, type = "l", ylab = "Global Active Power (kilowatts)"))

## plot 2nd Graph ##
with(household, plot(Time, Voltage, type = "l", ylab = "Voltage"))

## plot 3rd Graph ##
with(household, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(household, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(household, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## plot 4th Graph ##
with(household, plot(Time, Global_reactive_power/1000, type = "l", ylab = "Global Reactive Power (kilowatts)"))

## close Device
dev.off()
