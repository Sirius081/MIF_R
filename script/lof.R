#data
data=read.table("data/sampleNaoGengSi.txt")
attach(data)
data15=data[year==15,]
detach(data)
fea=data15[3:4]

#parameter
par(mfrow=c(2,1))
k=10 #num of neighbors
p=0.95 #percentage of normal
max.axis=15000 

#lof
library(dbscan)
score=lof(fea,k)
outlier=fea[score>quantile(score,seq(0,1,by=0.01))[p*100],]
numsOfOutliers=data15[score>quantile(score,seq(0,1,by=0.01))[p*100],]$num
write(as.character(numsOfOutliers),"output/lofOutliers.txt")
#plot
plot(fea)
points(outlier,col="red",pch="x",cex=2)
plot(fea,xlim=c(0,max.axis),ylim=c(0,max.axis))
points(outlier,col="red",pch="x",cex=2) 