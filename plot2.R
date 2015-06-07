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
#Plot
par(mfrow=c(1,1),mar = c(4, 4, 1, 1), oma = c(1, 2, 2, 1))
plot(consumptionTime,consumptionData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#Copy to a PNG file
dev.copy(png,"plot2.png",width=480,height=480,res=90)
dev.off()