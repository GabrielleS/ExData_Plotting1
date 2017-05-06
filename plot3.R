# Download & unzip zip file from Explatory Data Analysis
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="Dataset.zip", mode="w", method="curl")
data <- unzip(zipfile="Dataset.zip")

# Create a dataframe with the data for all graphs for the two days
data_df      = read.table(data[1], header=T, sep=";")
data_df$Date = as.Date(data_df$Date, "%d/%m/%Y")
data_df      = subset(data_df, Date == "2007-02-01" | Date == "2007-02-02")

# plot3.R creating plot3.png
png("plot3.png",  width = 480, height = 480)
plot(x= as.POSIXct(paste(as.Date(data_df$Date), data_df$Time)), y = data_df$Sub_metering_1, type= "l",
     xlab = "", ylab = "Energy Sub Metering", col="black")
lines(x= as.POSIXct(paste(as.Date(data_df$Date), data_df$Time)), y = data_df$Sub_metering_2, col= "red")
lines(x= as.POSIXct(paste(as.Date(data_df$Date), data_df$Time)), y = data_df$Sub_metering_3, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="-")
dev.off()
