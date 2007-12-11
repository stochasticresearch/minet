disc <- function( data, disc.method="equalfreq", nbins=sqrt(nrow(data)) )
{
      if(!is.data.frame(data))
            data <- as.data.frame(data)
      varnames <- names(data)
      dimensions <- dim(data)
      # replace NA
      data <- as.vector(data.matrix(data))
      indices <- which(is.na(data))
      if(length(indices!=0))
            data[indices]<- -2000000
      dim(data) <- dimensions
      res <- NULL
      if( disc.method=="equalfreq" )
            res <- .C("discEF",
                as.double(data),
                as.integer(nrow(data)),
                as.integer(ncol(data)),
                as.integer(nbins),
                res=integer(nrow(data)*ncol(data)),
                DUP=FALSE,PACKAGE="minet")$res
      else if( disc.method=="equalwidth" )
            res <- .C("discEW",
                as.double(data),
                as.integer(nrow(data)),
                as.integer(ncol(data)),
                as.integer(nbins),
                res=integer(nrow(data)*ncol(data)),
                DUP=FALSE,PACKAGE="minet")$res 
      else stop("unknown discretization method")  
      dim(res) <- dimensions
      res <- as.data.frame(res)
      names(res) <- varnames
      res
}
