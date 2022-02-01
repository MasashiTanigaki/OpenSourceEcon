rm(list=ls())
library(rsample)     # data splitting 
library(dplyr)       # data wrangling
library(rpart)       # performing regression trees
library(rpart.plot)  # plotting regression trees
library(ipred)       # bagging
library(caret)       # bagging
library(randomForest)
library(tidyverse)
library(ineq)
library(ggpubr)
library(caTools)
library(rrapply)
library(gglorenz)
library(lubridate)
library(plyr)
library(nycflights13)
library(zoo)
library(gdata)
library(reshape2)
library(plm)
library(PerformanceAnalytics)
library(e1071)
library(gdata)
library(rpart)
library(rpart.plot)
setwd("/Volumes/TanigakiSSD/EconData/")
Data=read.csv("Japanese_Economics.csv")
names(Data)[names(Data)=="Lending_to_Corporate..Inc.Financial."]="Lending_to_Corp_Incl_Financial_Inst"
Data=Data[2:length(Data)]
Data$Date=as.Date(Data$Date)
Data$Money_Multiplier=Data$M3/Data$MB
MB_analysis=subset(Data,select=c("Date","M3","MB","Money_Multiplier"))
MB_analysis=na.omit(MB_analysis)
color=c("Monetary Stock"="Blue","Monetary Base"="Red")
P1=ggplot(MB_analysis,aes(x=Date),na.rm = TRUE)+
  geom_line(aes(y=M3,color="Monetary Stock"))+
  geom_line(aes(y=MB,color="Monetary Base"))+
  labs(x = "Date",y = "MB and M3",color = "Legend")+
  scale_color_manual(name='Labels',
                     breaks=c("Monetary Stock","Monetary Base"),
                     values=color)
P2=ggplot(MB_analysis,aes(x=Date),na.rm = TRUE)+
  geom_point(aes(y=Money_Multiplier),color="green")
ggarrange(P1,P2,nrow=2,ncol=1,common.legend = TRUE)


ggplot(Data,aes(Date))+
  geom_line(aes(y=Lending_to_Corp_Incl_Financial_Inst,color="Total"))+
  geom_line(aes(y=Lending_to_Corporate_for_Facility_Investment,color="Facility_Inves"))+
  geom_line(aes(y=Lending_to_Corporate_small_mid_Enterprises,color="Small_Mid"))+
  geom_line(aes(y=Lending_to_Individual,color="Individual"))

Data$Total_Lending_of_Large_Local_Banks
Lending_analysis=subset(Data,select=c("Date",
                                      "Total_Lending_of_Banks_and_Shinkin_Bank",
                                      "Total_Lending_of_Banks",
                                      "Total_Lending_of_Large_Local_Banks",
                                      "Total_Lending_of_Metropolitan_Banks",
                                      "Total_Lending_of_Small_Local_Banks",
                                      "Total_Lending_of_Shinkin_Banks",
                                      "Total_Lending_of_Foreign_Banks"))
Lending_analysis=na.omit(Lending_analysis)
ggplot(Lending_analysis,aes(Date))+
  geom_line(aes(y=Total_Lending_of_Banks_and_Shinkin_Bank,color="Total_Lending_of_Banks_and_Shinkin_Bank"))+
  geom_line(aes(y=Total_Lending_of_Banks,color="Total_Lending_of_Banks"))+
  geom_line(aes(y=Total_Lending_of_Large_Local_Banks,color="Total_Lending_of_Large_Local_Banks"))+
  geom_line(aes(y=Total_Lending_of_Metropolitan_Banks,color="Total_Lending_of_Metropolitan_Banks"))+
  geom_line(aes(y=Total_Lending_of_Small_Local_Banks,color="Total_Lending_of_Small_Local_Banks"))+
  geom_line(aes(y=Total_Lending_of_Shinkin_Banks,color="Total_Lending_of_Shinkin_Banks"))+
  geom_line(aes(y=Total_Lending_of_Foreign_Banks,color="Total_Lending_of_Foreign_Banks"))
  
Data$Reserve_Percentage=Data$MB_BOJ_Current_Deposit/Data$MB
P1=ggplot(Data,aes(Date))+
  geom_line(aes(y=MB_BOJ_Current_Deposit,color="BOJ_Deposit"))+
  geom_line(aes(y=M3,color="Money Stock"))+
  geom_line(aes(y=Total_Lending_of_Banks_and_Shinkin_Bank,color="Total_Lending"))
P2=ggplot(Data,aes(Date))+geom_line(aes(y=Reserve_Percentage,color="Reserve_Rate"))
ggarrange(P1,P2,nrow=2,ncol=1,common.legend = TRUE)


P1=ggplot(Data,aes(Date))+
  geom_line(aes(y=Export_CPI_Average,color="Export"))+
  geom_line(aes(y=Import_CPI_Average,color="Import"))
P2=ggplot(Data,aes(Date))+
  geom_line(aes(y=FX_End_Month_17PM,color="17PM"))+
  geom_line(aes(y=FX_End_Month_Central,color="Central"))
ggarrange(P1,P2,nrow=2,ncol=1,common.legend = TRUE)
