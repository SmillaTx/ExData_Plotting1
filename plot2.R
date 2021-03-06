# reading the dataset
data <-file.choose() OR data <- "./data/household_power_consumption.txt"
dataset<-read.table(data,skip=1,sep=";")
names(dataset) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# creating the subset used for this exercise
subdata <- subset(dataset,dataset$Date=="1/2/2007" | dataset$Date =="2/2/2007")

# defining the variables
date <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power<-as.numeric(subdata$Global_active_power)

# open the png file used to store the graph
png("plot2.png", width=480, height=480)

# creating the plot
plot(date, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# closing the png-file
dev.off()