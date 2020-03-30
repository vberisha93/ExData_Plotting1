
#set working directory
setwd("~/R_Files/Coursera/Data_Science_Foundations_Using_R/Course_4_Exploratory_Data_Analysis/Week_1/exdata_data_household_power_consumption")

#read in data
df1 <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(df1) <- c("Date","Time","Global_active_power",
                "Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1",
                "Sub_metering_2","Sub_metering_3")
df1.1 <- subset(df1, df1$Date == "1/2/2007" | df1$Date == "2/2/2007")

#plot 2

df1.1$Date <- as.Date(df1.1$Date, format="%d/%m/%Y")
df1.1$Time <- strptime(df1.1$Time, format="%H:%M:%S")
df1.1[1:1440,"Time"] <- format(df1.1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df1.1[1441:2880,"Time"] <- format(df1.1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(df1.1$Time,as.numeric(as.character(df1.1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#export png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()