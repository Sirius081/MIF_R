#data
data=read.table("data/sampleNaoGengSi.txt")
#"year"  "num"   "a"     "b"     "c"     "a_m"   "b_m"   "c_m"   "fee"  "group"
attach(data)
data15=data[year==15,]
detach(data)
fea=data15[c(3,4,10)]
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
p=0.95
#algorithm
library(MASS)
rr=rlm(group~a+b,data = fea)
pre=fitted(rr)
score=pre-fea$group
outlier=data15[score>quantile(score,seq(0,1,by=0.01))[p*100],]
numsOfOutliers=data15[score>quantile(score,seq(0,1,by=0.01))[p*100],]$num
write(as.character(numsOfOutliers),"output/robustRegressionOutliers.txt")
