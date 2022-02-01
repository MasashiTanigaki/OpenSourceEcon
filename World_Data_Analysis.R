# Housekeeping
library(ggplot2)
library(plyr)
library(vars)
library(mFilter)
library(tseries)
library(TSstudio)
library(forecast)
library(tidyverse)
rm(list=ls())
Countries=c("JPN","USA","ESP","DEU","ITA","FRA","CAN","KOR","AUS","GBR")
Colors=c("#EA1C0A","#032A4A","#FFC923","black","#9C3597","#4AA4DE","brown","blue","#00843D","#00008B")
# Export
Export=read.csv("Exports.csv")
Export=Export[Export$LOCATION %in% Countries,]
Export=Export[,c(1,6:7),]
colnames(Export)=c("Country","Year","Export")
# Population by Million
Population = read.csv("Pop.csv")
Population=Population[Population$LOCATION %in% Countries,]
Population=Population[,c(1,6:7),]
colnames(Population)=c("Country","Year","Population")
Population=subset(Population,Year>1969)
EconData=merge(Population,Export,by=c("Year","Country"),all.x=TRUE)
# Fertility
Fertility = read.csv("Fertility.csv")
Fertility=Fertility[Fertility$LOCATION %in% Countries,]
Fertility=Fertility[,c(1,6,7),]
colnames(Fertility)=c("Country","Year","Fertility")
EconData=merge(EconData,Fertility,by=c("Year","Country"),all.x=TRUE)
# GDP
Data=read.csv("GDP.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","GDP")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# GDP hours worked
Data=read.csv("GDP_hrs_worked.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","GDP_Hours_Worked")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Trade Goods and Services
Data=read.csv("Trade_GS.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Trade_Goods_Service")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Unemployment
Data=read.csv("Unemp.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Unemployment")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Household Financial Asset
Data=read.csv("HH_FInancial_Asset.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Financial_Asset")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Household Saving
Data=read.csv("HH_saving.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Saving")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Household Net Wealth
Data=read.csv("HH_netwealth.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Net_Wealth")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Long term unemployment
Data=read.csv("Long_Umemp.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Long_term_unemployment")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Youth Unemployment
Data=read.csv("HH_FInancial_Asset.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Youth_Unemployment")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Young Population
Data=read.csv("Young_Pop.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Young_Population")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Young Population
Data=read.csv("Current_Account.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Current_Account")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Suicide Rate
Data=read.csv("Suicide.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Suicide_Rate")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Short-term Interest Rate
Data=read.csv("SR_Int.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","SR_Int_Rate")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Long-term Interest Rate
Data=read.csv("LT_Int.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","LT_Int")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Household Expenditure
Data=read.csv("Expenditure.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Expenditure")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
# Disposable Income
Data=read.csv("Disposable_Inc.csv")
Data=Data[Data$LOCATION %in% Countries,]
Data=Data[,c(1,6:7),]
colnames(Data)=c("Country","Year","Disp_Inc")
Data=subset(Data,Year>1969)
EconData=merge(EconData,Data,by=c("Year","Country"),all.x=TRUE)
colnames(EconData)=c("Year","Country","Pop","Exp","Fert","GDP","GDP_hrsw","Trade_GS","Unemp"
                     ,"Asset","Saving","Net_Wealth","LT_Unemp","Youth_Unemp","Youth_Pop","CA"
                     ,"Suicide","ST_Int","LT_Int","Expenditure","Disp_Inc")

EconData=ddply(EconData,"Country",transform,D_Unemp=c(0,diff(Unemp)))
EconData=ddply(EconData,"Country",transform,D_Y_Unemp=c(0,diff(Youth_Unemp)))
EconData=ddply(EconData,"Country",transform,GDP_grwh=c(0,exp(diff(log(GDP)))-1))








