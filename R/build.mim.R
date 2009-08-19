build.mim <- function( dataset, estimator = "mi.mm", disc = "none", nbins = sqrt(NROW(dataset)))
{
	if( estimator=="spearman" || estimator=="pearson" || estimator=="kendall") {
		  mim <-cor(dataset,method=estimator)^2
          diag(mim)<-0
	}
	else if(estimator == "mi.mm")
		estimator = "mm"
	else if(estimator == "mi.empirical")
		estimator = "emp"
	else if(estimator == "mi.sg")
		estimator = "sg"
	else if (estimator == "mi.shrink")
		estimator = "shrink"
	else
          stop("unknown estimator")
		  
	if( estimator=="mm" || estimator=="emp" || estimator=="sg" || estimator=="shrink") {
		   if( disc == "equalfreq" || disc == "equalwidth" || disc == "globalequalwidth")
				dataset<-discretize(dataset, disc, nbins)
		   mim <-mutinformation(dataset,method=estimator)
		   diag(mim) <- 0
	}
	
	mim
}
