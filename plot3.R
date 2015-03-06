  ## plot3

  ## set english environment
  Sys.setlocale("LC_COLLATE", "English")
  Sys.setlocale("LC_CTYPE", "English")
  Sys.setlocale("LC_MONETARY", "English")
  Sys.setlocale("LC_TIME", "English")  
  
  ## Load data
  st <- "1/2/2007"  ## dataload from
  en <- "2/2/2007"  ## dataload to
  
  st_date <- as.Date(st,"%d/%m/%Y")
  en_date <- as.Date(en,"%d/%m/%Y")
  
  # Read just required columns
  data <- read.csv("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="?", colClass=c(NA, NA, 'NULL', 'NULL', 'NULL', 'NULL', NA, NA, NA))
  
  ## Data restriction
  data <- data[data$Date==st | data$Date==en,]
  
  ## Retype proper data
  data$Date_time <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
  data$Sub_metering_1 <- as.double(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.double(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.double(as.character(data$Sub_metering_3))
  
  ## axis x
  daysValues <- seq(st_date, en_date+1, 1)
  daysLabels <- weekdays(daysValues)
  #daysLabels <- format(daysValues,"%a")
  ## axis y
  #sub_meteringLabels <- seq(0,30,10)
  
  ## Draw a plot
  png(filename="plot3.png",width = 480, height = 480)
  par(mfrow=c(1,1))
  
  plot(data$Date_time, data$Sub_metering_1, type="l", main="",  xlab="", ylab="Energy sub metering")
  lines(data$Date_time, data$Sub_metering_2, col="red")
  lines(data$Date_time, data$Sub_metering_3, col="blue")
  axis(1, at = daysValues, labels = daysLabels)
  #axis(side=2, at=sub_meteringLabels, labels=sub_meteringLabels)
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'), bty='n', lty=1) #pch=1:2)
  #box()
  
  ## Copy a plot to a PNG file
  ## dev.copy(png, file = "plot3.png", width=480, height=480)
  dev.off()