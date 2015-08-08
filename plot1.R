# This is for the Coursera Exploratory data Analysis class, Project 1, plot 1.
# This R code will generate a file called "plot1.png" and place it in your working directory

# First, download the data set from UC Irvine Machine Learning Repository (see link in README.md file)
# Be sure to set your working directory to where the data file is located

# 
#read in all the data
householdPC<- read.table("household_power_consumption.txt", 
                         header = TRUE, 
                         sep = ";", 
                         colClasses = c("character", "character", rep("numeric",7)), 
                         na.strings="?")

#convert Date column to date format as recognized in r
householdPC$Date <-as.Date(householdPC$Date, format = "%d/%m/%Y") 
dataofinterest <- householdPC[(householdPC$Date == "2007-02-01") | (householdPC$Date =="2007-02-02"), ]


## Create plot1 and assign the filename to plot1.png
png(filename="plot1.png", width=480, height=480)
hist(dataofinterest$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()
