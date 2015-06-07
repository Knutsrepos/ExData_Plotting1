#set working directory
setwd("~/Lectures/Data_Science/Exploratory_Data_Science")
#unzip and import data
data<-read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep=";",header=TRUE,na.strings='?')
#extract the subset 1/2/2007 to 2/2/2007
consumptionData<-data[(data[,'Date']=="1/2/2007")|(data[,'Date']=="2/2/2007"),]
#plot
par(mfrow=c(1,1),mar = c(4, 4, 1, 1), oma = c(1, 2, 2, 1))
with(consumptionData,hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
#Copy to a PNG file
dev.copy(png,"plot1.png",width=480,height=480,res=90)
dev.off()