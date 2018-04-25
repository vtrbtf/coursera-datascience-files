csv <- read.csv("household_power_consumption.txt" , header = TRUE, sep = ";", na.strings = c("?"))
bydate <- csv[csv$Date == "1/2/2007" | csv$Date == "2/2/2007",]

png(filename = "plot3.png", width = 480, height = 480)
par(mar = c(2,4,1,0.5))

plot(bydate$Sub_metering_1, type="l", ylim=c(0,max(bydate$Sub_metering_1, bydate$Sub_metering_2, bydate$Sub_metering_3)), col = "purple", axes = FALSE, xlab = "", ylab = "Energy sub metering", frame.plot = TRUE)
lines(bydate$Sub_metering_2, type = "l", col = "red")
lines(bydate$Sub_metering_3, type = "l", col = "blue")
axis(1, at=c(1, 1440, 2880), labels = c("Thu", "Fri" , "Sat") )
axis(2, at=c(0, 10, 20, 30) )
dev.off()