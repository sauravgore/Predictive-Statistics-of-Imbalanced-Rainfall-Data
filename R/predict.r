Sys.setenv(HADOOP_CMD="/home/hduser/work/hadoop-1.1.2/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/home/hduser/work/hadoop-1.1.2/contrib/streaming/hadoop-streaming-1.1.2.jar")
Sys.setenv(HADOOP_HOME="/home/hduser/work/hadoop-1.1.2")
Sys.setenv(JAVA_HOME="/usr/lib/jvm/java-1.6.0-openjdk-amd64")
library(rhdfs)
hdfs.init()
f = hdfs.file("/usr/ouput3/part-m-00000.csv","r",buffersize=104857600)
m = hdfs.read(f)
c = rawToChar(m)
annual=f[f[,3] == "type district_name",4]
  #print ("True")
  head(annual)
  tail(annual)
  a=ts(annual,start = 1901,end = 2015,frequency = 1)
  a
  ha=HoltWinters(a,beta = F,gamma = F)
  ha
  ha$fitted
  ha$SSE
  fha=forecast:::forecast.HoltWinters(ha,h=5)
  fha
  forecast:::plot.forecast(fha)
  
print ("false")

plot.ts(cbind(a,b))
plot.ts(cbind(c,b),plot.type = "single",col = c("red","blue"),main="rainfall comparison in PUNJAB and Assam_Meghalaya")
plot.ts(cbind(marathwada,vidarbha),plot.type="single",col=c("red","blue"),main="rainfall in vidarbha and marathwada",legend("topleft", c("marathwada", "vidarbha"),lwd=1,col=c("red", "blue")))

