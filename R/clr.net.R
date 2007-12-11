clr.net <- function( mim )
{
      var.id<-NULL
      if(is.data.frame(mim)) {
            var.id <- names(mim)
            mim <- as.matrix(mim)
      }
      else if( is.matrix(mim) ) 
            var.id <- names(as.data.frame(mim))
      else stop("Supply a matrix-like argument")      
      if(ncol(mim) != nrow(mim))
          stop("Argument matrix must be square")
 
      res <- .C( "clrnet",
            as.double(mim),
            as.integer(ncol(mim)),
            res = double(ncol(mim)*ncol(mim)),
            DUP=FALSE,PACKAGE="minet")$res

      dim(res) <- dim(mim)
      res <- as.data.frame(res)
      names(res)<-var.id
      row.names(res)<-var.id
      as.matrix(res)               
}
