# Download & unzip zip file from Explatory Data Analysis
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile="Dataset.zip", mode="w", method="curl")
data <- unzip(zipfile="Dataset.zip")

# Create a dataframe with the data for all graphs for the two days
data_df      = read.table(data[1], header=T, sep=";")
data_df$Date = as.Date(data_df$Date, "%d/%m/%Y")
data_df      = subset(data_df, Date == "2007-02-01" | Date == "2007-02-02")

# plot1.R creating plot1.png
png("plot1.png",  width = 480, height = 480)
hist(as.numeric(data_df$Global_active_power)/1000, col="red",  
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
