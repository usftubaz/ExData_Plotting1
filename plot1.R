plot1 <- function() {
    ##Read file
    data <- read.table(file="exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)
    data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    ##Creat plot
    hist(data$Global_active_power, col="Red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    dev.copy(png,file="plot1.png")
    dev.off()
}