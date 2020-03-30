
#set working directory
setwd("~/R_Files/Coursera/Data_Science_Foundations_Using_R/Course_4_Exploratory_Data_Analysis/Week_1/exdata_data_household_power_consumption")

#read in data
df1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(df1) <- c("Date","Time","Global_active_power",
                "Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1",
                "Sub_metering_2","Sub_metering_3")
df1.1 <- subset(df1, df1$Date == "1/2/2007" | df1$Date == "2/2/2007")

#plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(df1.1$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")
dev.off()