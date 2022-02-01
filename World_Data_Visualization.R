setwd("/Volumes/TanigakiSSD/EconData")
source("World_Data_Analysis.R")

# Plots
`+.uneval` <- function(a,b) {
  `class<-`(modifyList(a,b), "uneval")
}
name=c("Pop","Exp","Fert","GDP","GDP_hrsw",
       "Trade_GS","Unemp","Asset","Saving","Net_Wealth",
       "LT_Unemp","Youth_Unemp","Youth_Pop","CA","Suicide",
       "ST_Int","LT_Int","Expenditure","Disp_Inc","D_Unemp","D_Y_Unemp","GDP_grwh")
Transform=c("Pop"="Population","Exp"="Export","Fert"="Fertility Rate","GDP"="GDP","GDP_hrsw"="GDP Hours Worked",
       "Trade_GS"="Trade_Goods_Service","Unemp"="Unemployment","Asset"="Household Financial_Asset",
       "Saving"="Household Saving","Net_Wealth"="Household Net Wealth",
       "LT_Unemp"="Long-term Unemployment Rate","Youth_Unemp"="Youth Unemployment Rate",
       "Youth_Pop"="Youth Populatoin","CA"="Current Account","Suicide"="Suicide Rate",
       "ST_Int"="Short-term Interest Rate","LT_Int"="Long-term Interest Rate",
       "Expenditure"="Household Expenditure","Disp_Inc"="Household Disposable Income",
       "D_Unemp"="Unemployment margin","D_Y_Unemp"="Youth Unemployment margin",
       "GDP_grwh"="GDP growth")
setwd("/Volumes/TanigakiSSD/EconData/Graphs")
for (i in 3:length(EconData)){
  Plot=ggplot(EconData,aes(Year,EconData[,i],color=Country))+geom_line(lwd=1.1)+
    scale_color_manual(breaks=Countries,values=Colors)+ylab(paste(names(EconData)[i]))+ggtitle(paste(Transform[names(EconData)[i]]))
  ggsave(paste(names(EconData)[i],".jpeg",sep=""),plot=Plot)
  
  
}



JPN=subset(EconData,EconData$Country=="JPN")
