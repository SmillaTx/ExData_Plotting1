# reading the dataset
data <-file.choose() OR data <- "./data/household_power_consumption.txt"
dataset<-read.table(data,skip=1,sep=";")
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# creating the subset used for this exercise
subdata <- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

# defining the variables
date <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(subdata$Global_active_power)
global_reactive_power <- as.numeric(subdata$Global_reactive_power)
sub_Metering_1 <- as.numeric(subdata$Sub_metering_1)
sub_Metering_2 <- as.numeric(subdata$Sub_metering_2)
sub_Metering_3 <- as.numeric(subdata$Sub_metering_3)
voltage <- as.numeric(subdata$Voltage)

# open the png-file 
png("plot4.png", width=480, height=480)

# creating the different plots 
par(mfrow = c(2, 2)) 

plot(date, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date, sub_Metering_2, type="l", col="red")
lines(date, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# closing the png-file 
dev.off()

