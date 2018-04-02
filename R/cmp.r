#Rainfall comparision between COASTAL KARNATAKA & KONKAN & GOA rainfall 1901-2015


c_k=read.csv("/home/hduser/Desktop/part-m-00000.csv")
annual1=c_k[c_k[,1]=="COASTAL KARNATAKA",3]
ck=ts(annual1,start = 1901,end = 2015,frequency = 1)
ck
plot.ts(ck)


k_g=read.csv("/home/hduser/Desktop/part-m-00000.csv")
annual2=k_g[k_g[,1]=="KONKAN & GOA",3]
kg=ts(annual2,start = 1901,end = 2015,frequency = 1)
kg
plot.ts(kg)


plot.ts(cbind(ck,kg),plot.type = "single",col = c("red","blue"),main="Rainfall in KONKAN & GOA Vs COASTAL KARNATAKA",lwd=2.5,ylim=c(1500,6000),xlab="Year",ylab="Rainfall in mm",legend("topleft",c("COASTAL KARNATAKA","KONKAN & GOA"),lwd=2.5,cex=0.61,coCOASTl = c("red","blue")))

