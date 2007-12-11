validate <- function( inet, tnet, narcs=10 )
{
      if(max(tnet)!=1)
         stop("argument 'tnet' must be a boolean matrix")
      if(all( dim(inet)!=dim(tnet) ))
         stop("networks must have the same size")
      if(all( names(as.data.frame(inet))!=names(as.data.frame(tnet))) )
         stop("networks must have the same node names")
      inet <- as.matrix(inet)
      tnet <- as.matrix(tnet)
      # Checking edge orientation
      if( !isSymmetric(inet) && isSymmetric(tnet)) {
         warning("infered network arcs will be consider as undirected edges")
         inet <- .C("symmetrize",as.integer(inet),as.integer(ncol(inet)),
                    res=integer(ncol(inet)*ncol(inet)),DUP= FALSE, PACKAGE="minet")$res
      }
      else if( isSymmetric(inet) && !isSymmetric(tnet) ){
         warning("true network arcs will be considerd as undirected edges")
         tnet <- .C("symmetrize",as.integer(tnet),as.integer(ncol(tnet)),
                    res=integer(ncol(tnet)*ncol(tnet)),DUP= FALSE, PACKAGE="minet")$res
      }
      ressize<-as.integer(ncol(inet)*ncol(inet)/narcs)
      res <- .C("validate",
                as.double(inet),
                as.double(tnet),
                as.double(min(inet)),
                as.double(max(inet)),
                as.integer(ncol(inet)),
                as.integer(narcs),
                res = integer(4*ressize),
                DUP=FALSE, PACKAGE="minet")$res
      dim(res) <- c(ressize,4)
      res <- as.data.frame(res)
      names(res) <- c("tp","fp","tn","fn")      
      res
}
