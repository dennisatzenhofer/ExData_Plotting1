#### Exploratory Data Analysis | Plot 1 ####

## Note that the household_power_consumption file has to be stored in the current working directory
## Otherwise, use setwd() to select the directory with the data file. 

library(data.table) ## This code requires the data.table package. It can be installed using install.packages ("data.table")

Electric_Power_data <- fread("household_power_consumption.txt", 
                             sep = ";", 
                             na.strings = "?", 
                             skip = 66637, 
                             nrows = 2880, 
                             col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                             )
hist(Electric_Power_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "Plot1.png") ## Copy my plot to a PNG file
dev.off()