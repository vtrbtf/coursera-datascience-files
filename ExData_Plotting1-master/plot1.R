csv <- read.csv("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = c("?"))
bydate <- csv[csv$Date == "1/2/2007" | csv$Date == "2/2/2007",]

png(filename = "plot1.png", width = 480, height = 480)
par(mar = c(2,4,1,0.5))
hist(bydate$Global_active_power, col = "red", xlab = "Global Active Power ( kilowatts )", las=1, main = "Global Active Power")
dev.off()