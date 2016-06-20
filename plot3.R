#### Exploratory Data Analysis | Plot 3 ####

## Note that the household_power_consumption file has to be stored in the current working directory
## Otherwise, use setwd() to select the directory with the data file. 


#### loading packages
library(data.table) ## This code requires the data.table package. It can be installed using install.packages ("data.table")
library(lubridate)

#### loading the data in R ####

Electric_Power_data <- fread("household_power_consumption.txt", 
                             sep = ";", 
                             na.strings = "?", 
                             skip = 66637, 
                             nrows = 2880, 
                             col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

#### Converting Columns "Date" and "Time" in date and time formats ####
Electric_Power_data$Date <- as.Date(Electric_Power_data$Date, format = "%d/%m/%Y")
Electric_Power_data$Times <- paste(Electric_Power_data$Date, Electric_Power_data$Time, sep = ",")
Electric_Power_data$Times <- ymd_hms(Electric_Power_data$Times) # New column "Times" with date and time combined



## Creating the plot
plot(Electric_Power_data$Times, Electric_Power_data$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering",
     xlab = "")
lines(Electric_Power_data$Times, Electric_Power_data$Sub_metering_2, 
      type = "l", 
      col = "red")
lines(Electric_Power_data$Times, Electric_Power_data$Sub_metering_3, 
      type = "l", 
      col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, box.lty = 0, inset = 0.01)

dev.copy(png, file = "Plot3.png") ## Copy my plot to a PNG file
dev.off()
