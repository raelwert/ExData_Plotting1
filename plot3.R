library(data.table)

WorkingDir <- getwd()

PlotData <- fread(file.path(WorkingDir, "household_power_consumption.txt"))

#utils::View(PlotData$Date)

PlotData <- subset(PlotData, PlotData$Date == "1/2/2007" | PlotData$Date == "2/2/2007" )

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
  lty = 1
  )

png("Plot3.png", type = c("windows"))

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
  lty = 1
)

dev.off()