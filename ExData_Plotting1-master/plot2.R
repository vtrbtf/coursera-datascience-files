csv <- read.csv("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = c("?"))
bydate <- csv[csv$Date == "1/2/2007" | csv$Date == "2/2/2007",]

png(filename = "plot2.png", width = 480, height = 480)
par(mar = c(2,4,1,0.5))
plot(bydate$Global_active_power, type="l", ylab = "Global Active Power ( kilowatts )", axes = FALSE, xlab = "", frame.plot = TRUE)
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri" , "Sat") )
axis(2, at=c(0, 2, 4, 6) )
dev.off()