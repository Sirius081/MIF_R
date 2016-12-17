#data
data=read.table("data/sampleNaoGengSi.txt")
attach(data)
data15=data[year==15,]
detach(data)
par(mfrow=c(2,1))
fea=data15[3:4]

library(dbscan)

#choose eps(max dist in max frequence )
knn=kNN(fea,k=1)
dis=knn$dist
min_=min(dis)
max_=max(dis)
hist(dis,breaks = seq(min_,max_,by=(max_-min_)/800),xlim=c(0,1000))
e=2500
#choose minPts
mpts=10

db=dbscan(fea,eps = e,minPts = mpts)
db