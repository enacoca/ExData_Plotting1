##plot4
hpc <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
hpc$DateTime = paste(hpc$Date, hpc$Time)
hpc$DateTime = as.POSIXlt(hpc$DateTime,format="%d/%m/%Y %H:%M:%S")
hpc$Date = NULL
hpc$Time = NULL

subhpc <- subset(hpc,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

 
png("plot4.png",width=450, height=450)
par(mfrow = c(2, 2))

plot(subhpc$DateTime, subhpc$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power")

plot(subhpc$DateTime, subhpc$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")

plot(subhpc$DateTime, subhpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(subhpc$DateTime, subhpc$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", col = "red")
points(subhpc$DateTime, subhpc$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", )

plot(subhpc$DateTime, subhpc$Global_reactive_power, type = "l", xlab = "datetime",ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()