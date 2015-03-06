  ## plot1

  ## set english environment
  Sys.setlocale("LC_COLLATE", "English")
  Sys.setlocale("LC_CTYPE", "English")
  Sys.setlocale("LC_MONETARY", "English")
  Sys.setlocale("LC_TIME", "English")  

  ## Load data
  st <- "1/2/2007"  ## dataload from
  en <- "2/2/2007"  ## dataload to

  # Read just Date, Global Active Power
  data <- read.csv("household_power_consumption.txt", sep=";", dec=".", header=TRUE, na.strings="?", colClass=c(NA, 'NULL', NA, 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL'))

  ## Data restriction
  data <- data[data$Date==st | data$Date==en,]
  
  ## Retype proper data
  data$Global_active_power <- as.double(as.character(data$Global_active_power))
  
  ## Draw a plot
  png(filename="plot1.png",width = 480, height = 480)
  par(mfrow=c(1,1))
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
  box()
  
  ## Copy a plot to a PNG file
  ## dev.copy(png, file = "plot1.png", width=480, height=480)
  dev.off()