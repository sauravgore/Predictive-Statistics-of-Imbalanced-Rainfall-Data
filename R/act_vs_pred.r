#Konkan_Goa rainfall values(actual versus predicted)

k_g=read.csv("/home/hduser/Desktop/part-m-00000.csv")
annual2=k_g[k_g[,1]=="KONKAN & GOA",3]
kg=ts(annual2,start = 1901,end = 2010,frequency = 1)
kg
plot.ts(kg)
ha=HoltWinters(kg,beta = F,gamma = F)
ha
ha$fitted
ha$SSE
fha=forecast:::forecast.HoltWinters(ha,h=5)
fha
forecast:::plot.forecast(fha)



p=read.csv("/home/hduser/Documents/predicted.csv")
annual4=p[,2]
pd=ts(annual4,start = 1901,end = 2010,frequency = 1)
pd
plot.ts(pd)


m=read.csv("/home/hduser/Documents/MMMnew.csv")
annual3=m[,2]
mt=ts(annual3,start = 1901,end = 2010,frequency = 1)
mt
plot.ts(mt)



plot.ts(cbind(kg,pd,mt))
plot(cbind(kg,pd,mt),plot.type = "single")
plot(cbind(kg,pd,mt),plot.type = "single",col=c("black","green","red"))
plot(cbind(kg,pd,mt),plot.type = "single",col=c("black","green","red"),main="KONKAN AND GOA PREDICTED VS ACTUAL",xlab="Year",ylab="Rainfall in mm")
plot(cbind(kg,pd,mt),plot.type = "single",col=c("black","green","red"),main="KONKAN AND GOA PREDICTED VS ACTUAL",xlab="Year",ylab="Rainfall in mm",lwd=2.5,ylim=c(1000,5000))
plot(cbind(kg,pd,mt),plot.type = "single",col=c("black","green","red"),main="KONKAN AND GOA PREDICTED VS ACTUAL",xlab="Year",ylab="Rainfall in mm",lwd=2.5,ylim=c(1000,5000),legend("topleft",c("Actual","Predicted","Pre-proccessing Predicted"),lwd = 1,cex = 0.61,col = c("black","red","green")))

