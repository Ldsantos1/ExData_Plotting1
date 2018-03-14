## Open file in default directory with dot as decimals ##
hhfile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

## extracting only required data ##
hhfile$Time <- strptime(paste(hhfile$Date, hhfile$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
hhfile$Date <- as.Date(hhfile$Date, "%d/%m/%Y")
select <- hhfile$Date == "2007-02-01" | hhfile$Date == "2007-02-02"
household <- hhfile[select,1:9]
household$Global_active_power <- as.numeric(household$Global_active_power)

## removing loaded data from environment to release memory ##
rm(hhfile)

png(filename = "plot2.png", width = 480, height = 480)

## create line graph for Global Active Power ##
with(household, plot(Time, Global_active_power/1000, type = "l", ylab = "Global Active Power (kilowatts)"))

## close Device
dev.off()
