library(data.table)

WorkingDir <- getwd()

PlotData <- fread(file.path(WorkingDir, "household_power_consumption.txt"))

#utils::View(PlotData$Date)

PlotData <- subset(PlotData, PlotData$Date == "1/2/2007" | PlotData$Date == "2/2/2007" )

hist(as.numeric(PlotData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

png("Plot1.png", type = c("windows"))

hist(as.numeric(PlotData$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  
dev.off()