library(data.table)

WorkingDir <- getwd()

PlotData <- fread(file.path(WorkingDir, "household_power_consumption.txt"))

#utils::View(PlotData$Date)

PlotData <- subset(PlotData, PlotData$Date == "1/2/2007" | PlotData$Date == "2/2/2007" )

plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_active_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l")

png("Plot2.png", type = c("windows"))

plot(
  as.POSIXct(strptime(paste(PlotData$Date, PlotData$Time), "%d/%m/%Y%H:%M:%S")),
  as.numeric(PlotData$Global_active_power), 
  #weekdays(as.Date(PlotData$Date)),
  main = "", 
  ylab = "Global Active Power (kilowatts)",
  xlab = "",
  type = "l")

dev.off()