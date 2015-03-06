  ## plot2

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
  
  # Read just Date, Time, Global Active Power
  data <- read.csv("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="?", colClass=c(NA, NA, NA, 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL'))
  
  ## Data restriction
  data <- data[data$Date==st | data$Date==en,]
  
  ## Retype proper data
  data$Date_time <- strptime(paste(as.character(data$Date), as.character(data$Time)), "%d/%m/%Y %H:%M:%S")
  data$Global_active_power <- as.double(as.character(data$Global_active_power))
  
  ## axis x
  daysValues <- seq(st_date, en_date+1, 1)
  daysLabels <- weekdays(daysValues)
  #daysLabels <- format(daysValues,"%a")
  
  ## Draw a plot
  png(filename="plot2.png",width = 480, height = 480)
  par(mfrow=c(1,1))
  
  plot(data$Date_time, data$Global_active_power, type="l", main="",  xlab="", ylab="Global Active Power (kilowatts)")
  axis(1, at = daysValues, labels = daysLabels)
  #box()
  
  ## Copy a plot to a PNG file
  ## dev.copy(png, file = "plot2.png", width=480, height=480)
  dev.off()