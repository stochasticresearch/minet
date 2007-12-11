data(syn.data)
data(syn.net)

#MUTUAL INFORMATION ESTIMATION
estimator = "empirical"
mim <- build.mim(disc(syn.data),estimator)   

#INFERENCE
clr <- clr.net(mim)
mr  <- mr.net(mim)
ar  <- aracne.net(mim)

#VALIDATION
t.clr <- validate(clr,syn.net,narcs=10)
t.mr  <- validate(mr, syn.net,narcs=10)
t.ar  <- validate(ar, syn.net,narcs=10)

#RESULTS
dev <- show.pr(t.clr,col="red",type="b")
dev <- show.pr(t.ar,device=dev,col="blue", type="b",pch=3)
dev <- show.pr(t.mr,device=dev,col="green",type="b",pch=2)
legend("topright",legend=c("CLR","AR","MR"), col=c("red","blue","green"), pch=c(1,3,2))
dev <- show.roc(t.clr,col="red",type="b")
dev <- show.roc(t.ar,device=dev,col="blue",type="b",pch=3)
dev <- show.roc(t.mr,device=dev,col="green",type="b",pch=2)
legend("bottomright",legend=c("CLR","AR","MR"), col=c("red","blue","green"), pch=c(1,3,2))

#BEST F1SCORE
paste("CLR : ",round(max(fscores(t.clr)),3))
paste(" AR : ",round(max(fscores(t.ar)),3))
paste(" MR : ",round(max(fscores(t.mr)),3))

#REMOVING SOME EDGES
thrsh <- (max(mr)-min(mr))/4
for( i in 1:nrow(mr) )
     for( j in 1:nrow(mr) )
            if( mr[i,j]<thrsh ) mr[i,j]<-0

#MAKING graphNELs
library(Rgraphviz)
mr.graph  <- as(as.matrix(mr), "graphNEL")
true.graph<- as(as.matrix(syn.net), "graphNEL")

#SETTING ATTRIBUTES
n <- list(fillcolor="lightgreen",fontsize=8,fontcolor="red",height=.4,width=.4,fixedsize=F)
e <- list(fontsize=20)

#PLOT MRNET AND TRUE.NET
get(getOption("device"))(width=12,height=12)
plot(mr.graph, attrs = list(node=n,edge=e), main="MRNET") 
get(getOption("device"))()
plot(true.graph, attrs=list(node=n,edge=e), main="SYNTHETIC NETWORK")
