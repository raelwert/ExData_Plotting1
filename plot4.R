library(data.table)

WorkingDir <- getwd()

PlotData <- fread(file.path(WorkingDir, "household_power_consumption.txt"))

#utils::View(PlotData$Date)

PlotData <- subset(PlotData, PlotData$Date == "1/2/2007" | PlotData$Date == "2/2/2007" )

#test plot creation
par(mfrow = c(2,2))

#plot1
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_active_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l")

#plot2
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Voltage), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Voltage",
  xlab = "datetime",
  type = "l")

#plot3
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_1), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Energy sub metering",
  xlab = "",
  type = "l")

lines(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_2),
  col="red",
  type="l"
)

lines(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_3),
  col="blue",
  type="l"
)

legend(
  x="topright",
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col=c("black","red","blue"),
  lty = 1,
  bty = "n"
)

#plot4
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_reactive_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  xlab = "datetime",
  ylab = "Global_reactive_power",
  type = "l")


#save plot
png("Plot4.png", type = c("windows"))

par(mfrow = c(2,2))

#plot1
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_active_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l")

#plot2
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Voltage), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Voltage",
  xlab = "datetime",
  type = "l")

#plot3
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_1), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Energy sub metering",
  xlab = "",
  type = "l")

lines(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_2),
  col="red",
  type="l"
)

lines(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Sub_metering_3),
  col="blue",
  type="l"
)

legend(
  x="topright",
  legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
  col=c("black","red","blue"),
  lty = 1,
  bty = "n"
)

#plot4
plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_reactive_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  xlab = "datetime",
  ylab = "Global_reactive_power",
  type = "l")

dev.off()