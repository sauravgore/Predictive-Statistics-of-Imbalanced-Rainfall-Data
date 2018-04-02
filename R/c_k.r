#Predictive analysis of COASTAL KARNATAKA 2016-2020

c_k=read.csv("/home/hduser/Desktop/part-m-00000.csv")
annual1=c_k[c_k[,1]=="COASTAL KARNATAKA",3]
ck=ts(annual1,start = 1901,end = 2015,frequency = 1)
ck
plot.ts(ck)
ha=HoltWinters(ck,beta = F,gamma = F)
ha
ha$fitted
ha$SSE
fha=forecast:::forecast.HoltWinters(ha,h=5)
fha
forecast:::plot.forecast(fha)
forecast:::plot.forecast(fha,main = "PREDICTIVE ANALYSIS OF COASTAL KARNATAKA 2016-2020",ylim = c(1500,6000),xlab = "Year",ylab = "Rainfall in mm",lwd = 2.5)
