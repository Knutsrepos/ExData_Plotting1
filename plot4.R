#set working directory
setwd("~/Lectures/Data_Science/Exploratory_Data_Science")
#unzip and import data
data<-read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep=";",header=TRUE,na.strings='?')
#extract the subset 1/2/2007 to 2/2/2007
consumptionData<-data[(data[,'Date']=="1/2/2007")|(data[,'Date']=="2/2/2007"),]
#transform the first columns Date and Time from factor two time variables
consumptionTime<-paste(as.character(consumptionData$Date),as.character(consumptionData$Time))
consumptionTime<-strptime(consumptionTime,"%d/%m/%Y %H:%M:%S",tz="UTC")
#Set Language to English
Sys.setlocale("LC_ALL", "English")
#plot
par(mfrow=c(2,2),mar = c(4, 4, 1, 1), oma = c(1, 2, 2, 1))
#first
plot(consumptionTime,consumptionData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Second
plot(consumptionTime,consumptionData$Voltage,type="l",xlab="datetime",ylab="Voltage")
#Third
plot(consumptionTime,consumptionData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(consumptionTime,consumptionData$Sub_metering_2,col="red")
lines(consumptionTime,consumptionData$Sub_metering_3,col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Fourth
plot(consumptionTime,consumptionData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
#Copy to a PNG file
dev.copy(png,"plot4.png",width=480,height=480,res=90)
dev.off()