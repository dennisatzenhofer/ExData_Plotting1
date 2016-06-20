#### Exploratory Data Analysis | Plot 4 ####

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

#### Creating the plots ####
par(mfrow = c(2,2))

## Plot 1 
with (Electric_Power_data, 
      plot(Times, Global_active_power, 
           type = "l",
           ylab = "Global Active Power (kilowatts)",
           xlab = ""
      )
)

## Plot 2 
with (Electric_Power_data, 
      plot(Times, Voltage, 
           type = "l",
           ylab = "Voltage",
           xlab = "datetime"
      )
)

## Plot 3
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
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, cex=.7, box.lty = 0, inset = 0.01)

## Plot 4

with (Electric_Power_data, 
      plot(Times, Global_reactive_power, 
           type = "l",
           xlab = "datetime"
      )
)
