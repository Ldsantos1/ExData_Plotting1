## Open file in default directory with dot as decimals ##
hhfile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

## extracting only required data ##
hhfile$Date <- as.Date(hhfile$Date, "%d/%m/%Y")
select <- hhfile$Date == "2007-02-01" | hhfile$Date == "2007-02-02"
household <- hhfile[select,1:9]

## removing loaded data from environment to release memory ##
rm(hhfile)

png(filename = "plot1.png", width = 480, height = 480)

## create histogram for Global Active Power ##
hist(as.numeric(household$Global_active_power)/1000, xlab = "Global Active Power (kilowatts)", ylab= "Frequency", col= "red", main = "Global Active Power")

## close Device
dev.off()
