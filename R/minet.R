minet <- function(dataset, method="mrnet", estimator="empirical", disc.method="equalfreq",nbins=sqrt(nrow(dataset)) )
{
      net <- NULL
      if( estimator=="empirical" ||
          estimator=="shrink" ||
          estimator=="millermadow" )
          dataset <- disc(dataset,disc.method,nbins)
      else if( estimator!="gaussian")
          stop("unknown estimator")
      mim <- build.mim(dataset,estimator)
      if( method=="clrnet" || method=="clr" )
            net <- clr.net(mim)
      else if( method=="mrnet" || method=="mr" )
            net <- mr.net(mim)
      else if( method=="aracne" )
            net <- aracne.net(mim)
      else if( method=="relnet" || method=="rel" )
            net <- mim
      else stop( "uknown method" )
      norm(net)
}
