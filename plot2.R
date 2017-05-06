# Download & unzip zip file from Explatory Data Analysis
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="Dataset.zip", mode="w", method="curl")
data <- unzip(zipfile="Dataset.zip")

# Create a dataframe with the data for all graphs for the two days
data_df      = read.table(data[1], header=T, sep=";")
data_df$Date = as.Date(data_df$Date, "%d/%m/%Y")
data_df      = subset(data_df, Date == "2007-02-01" | Date == "2007-02-02")

# plot2.R creating plot2.png
png("plot2.png",  width = 480, height = 480)
plot(x= as.POSIXct(paste(as.Date(data_df$Date), data_df$Time)), y = data_df$Global_active_power, type= "l",
     xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()
