plot3 <- function() {
    ##Read file
    data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    data$DateTime <- paste(data$Date,data$Time, sep = " ")
    data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    
    ##Creat plot
    with(data,plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="", type="n"))
    with(data,points(DateTime,Sub_metering_2, type="n"))
    with(data,points(DateTime,Sub_metering_3, type="n"))
    with(data,lines(DateTime,Sub_metering_1))
    with(data,lines(DateTime,Sub_metering_2,col="Blue"))
    with(data,lines(DateTime,Sub_metering_2,col="Red"))
    with(data,lines(DateTime,Sub_metering_3,col="Blue"))
    legend("topright", lty="solid",col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.copy(png,file="plot3.png")
    dev.off()
}