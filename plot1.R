plot1 <- function() {
    ##Read file
    data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), skip=66636, nrows=2880)
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    ##Creat plot
    hist(data$Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.copy(png,file="plot1.png")
    dev.off()
}