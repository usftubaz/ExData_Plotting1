plot2 <- function() {
    ##Read file
    data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    data$DateTime <- paste(data$Date,data$Time, sep = " ")
    data$DateTime <- strptime(data$DateTime,format="%d/%m/%Y %H:%M:%S")
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    ##Creat plot
    with(data, plot(DateTime,Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="n"))
    with(data, lines(DateTime,Global_active_power))
    dev.copy(png,file="plot2.png")
    dev.off()
}