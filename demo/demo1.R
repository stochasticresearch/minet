data(bcell)

#INFERENCE
mr  <- minet( bcell, method="mrnet", estimator="empirical")
clr <- minet( bcell, method="clr", estimator="empirical")
ar  <- minet( bcell, method="aracne", estimator="empirical" )

#REMOVING SOME EDGES
tmr  <- (max(mr)-min(mr))/2
tclr <- 0.3
for( i in 1:nrow(mr) ) 
     for( j in 1:nrow(mr) ) {
            if( mr[i,j] < tmr) mr[i,j] <-0
            if( clr[i,j]<tclr) clr[i,j]<-0
     }

#MAKING graphNELs
library(Rgraphviz)
mr.graph <- as( as.matrix(mr), "graphNEL")
ar.graph <- as( as.matrix(ar), "graphNEL")
clr.graph<- as( as.matrix(clr),"graphNEL")

#SETTING ATTRIBUTES
n<- list(fillcolor="lightgreen",fontsize=8,fontcolor="red",height=.4,width=.4,fixedsize=F)
e<- list(fontsize=20)
                   
#PLOT MRNET AND TRUE.NET
get(getOption("device"))()
plot(mr.graph, attrs = list(node=n,edge=e), main="MRNET" ) 
get(getOption("device"))()
plot(ar.graph, attrs = list(node=n,edge=e), main="ARACNE" ) 
get(getOption("device"))()
plot(clr.graph, attrs = list(node=n,edge=e), main="CLR" )
