#data
data=read.table("data/sampleNaoGengSi.txt")
attach(data)
data15=data[year==15,]
detach(data)
fea=data15[3:4]
#plot
myPlot=function(fea,outlier){
  par(mfrow=c(2,1))
  max.axis=10000 
  plot(fea)
  points(outlier,col="red",pch="x",cex=2)
  plot(fea,xlim=c(0,max.axis),ylim=c(0,max.axis))
  points(outlier,col="red",pch="x",cex=2) 
}
#parameter

#algorithm

myPlot(fea,outlier)