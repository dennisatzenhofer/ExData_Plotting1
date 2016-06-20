#### Exploratory Data Analysis | Plot 2 ####

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
with (Electric_Power_data, 
     plot(Times, Global_active_power, 
          type = "l",
          ylab = "Global Active Power (kilowatts)",
          xlab = ""
          )
)
dev.copy(png, file = "Plot2.png") ## Copy my plot to a PNG file
dev.off()

