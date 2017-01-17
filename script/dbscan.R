#data
data=read.table("data/sampleNaoGengSi.txt")
attach(data)
data15=data[year==15,]
detach(data)
par(mfrow=c(2,1))
fea=data15[3:4]

library(dbscan)
max.axis=30000
#choose eps(max dist in max frequence )
knn=kNN(fea,k=1)
dis=knn$dist
min_=min(dis)
max_=max(dis)
#hist(dis,breaks = seq(min_,max_,by=(max_-min_)/800),xlim=c(0,1000))
e=1500
#choose minPts
mpts=5
db=dbscan(fea,eps = e,minPts = mpts)
outlier=fea[db$cluster==0,]
numsOfOutliers=data15[db$cluster==0,]$num
write(as.character(numsOfOutliers),"output/dbscanOutliers.txt")
#plot
plot(fea)
points(outlier,pch="x",cex=2,col="red")
plot(fea,xlim=c(0,max.axis),ylim=c(0,max.axis))
