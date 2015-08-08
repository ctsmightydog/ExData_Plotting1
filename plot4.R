# This is for the Coursera Exploratory data Analysis class, Project 1, plot4.
# This R code will generate a file called "plot4.png" and place it in your working directory

# First, download the data set from UC Irvine Machine Learning Repository (see link in README.md file)
# Be sure to set your working directory to where the data file is located

#read in all the data
householdPC<- read.table("household_power_consumption.txt", 
                         header = TRUE, 
                         sep = ";", 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na.strings="?")

#subset only the data of interest (Feb 1& 2, 2007)
householdPC$Date <-as.Date(householdPC$Date, format = "%d/%m/%Y") 
dataofinterest <- householdPC[(householdPC$Date == "2007-02-01") | (householdPC$Date =="2007-02-02"), ]

#make a new column with date+time 
dataofinterest$datetime <-paste(dataofinterest$Date, dataofinterest$Time, collapse = NULL, sep = ' ')

# convert the character data to POSIXct data and bind to existing data
dataofinterest$datetime <- strptime(dataofinterest$datetime, format="%Y-%m-%d %H:%M:%S", tz="UTC")


## Creating plot4
png(filename="plot4.png", width=480, height=480)


# Setting the page for 4 plots
par(mfcol=c(2,2))

# First plot
plot(dataofinterest$datetime, dataofinterest$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

# Second plot
plot(dataofinterest$datetime, dataofinterest$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(dataofinterest$datetime, dataofinterest$Sub_metering_2, col="red")
lines(dataofinterest$datetime, dataofinterest$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

# Third Plot
plot(dataofinterest$datetime, dataofinterest$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Fourth plot
plot(dataofinterest$datetime, dataofinterest$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
