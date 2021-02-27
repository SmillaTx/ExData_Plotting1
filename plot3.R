# reading the dataset
data <-file.choose() OR data <- "./data/household_power_consumption.txt"
dataset<-read.table(data,skip=1,sep=";")
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# creating the subset used for this exercise
subdata <- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

# defining the variables
date <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(subdata$Global_active_power)
sub_Metering_1 <- as.numeric(subdata$Sub_metering_1)
sub_Metering_2 <- as.numeric(subdata$Sub_metering_2)
sub_Metering_3 <- as.numeric(subdata$Sub_metering_3)

# open the png-file 
png("plot3.png", width=480, height=480)

# creating the plot and its legend 
plot(date, sub_Metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date, sub_Metering_2, type="l", col="red")
lines(date, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# closing the png-file 
dev.off()