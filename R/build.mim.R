build.mim <- function( data, mi.est = "empirical")
{
      n <- ncol(data)
      N <- nrow(data)
      var.id <- NULL
      if(is.data.frame(data)) 
           var.id <- names(data)            
      else if( is.matrix(data) )
            var.id <- names(as.data.frame(data))
      else stop("Supply a matrix-like argument")
      data <- data.matrix(data)
      if( mi.est != "gaussian" )
         if( !(all(data==round(data)) ))
            stop("Data must be discretized for this estimator")                      
      #Replace NA values
      data <- as.vector(data)
      indices <- which(is.na(data))
      if(length(indices!=0))
         data[indices] <- -2000000

      mim <- NULL
      if( mi.est == "gaussian" )
            mim <- .C( "buildMIMgaussian",
                  as.double(data),
                  as.integer(N),
                  as.integer(n),
                  res = double((n*n)),
                  DUP=FALSE,PACKAGE="minet")$res      

      else if(mi.est == "shrink")
            mim <- .C( "buildMIMshrink",
                  as.double(data),
                  as.integer(N),
                  as.integer(n),
                  res = double(n*n),
                  DUP=FALSE, PACKAGE="minet")$res      
 
      else if( mi.est == "empirical")
            mim <- .C( "buildMIMempirical",
                  as.double(data),
                  as.integer(N),
                  as.integer(n),
                  res = double(n*n),
                  DUP=FALSE, PACKAGE="minet")$res

      else if( mi.est == "millermadow" )
            mim <- .C("buildMIMmillermadow",
                  as.double(data),
                  as.integer(N),
                  as.integer(n),
                  res = double(n*n),
                  DUP=FALSE, PACKAGE="minet")$res

      else stop("unknown estimator")

      dim(mim) <- c(n,n)
      mim <- as.data.frame(mim)
      names(mim) <- var.id
      row.names(mim) <- var.id
      as.matrix(mim)
}
