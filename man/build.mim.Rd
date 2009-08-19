\name{build.mim}
\alias{build.mim}

\title{Build Mutual Information Matrix}
\usage{build.mim(dataset, estimator = "mi.mm", disc = "none", nbins = sqrt(NROW(dataset)))}
\arguments{
  \item{dataset}{data.frame containing gene expression data or any dataset where columns contain variables/features and rows contain outcomes/samples.}
  \item{estimator}{The name of the mutual information estimator. The package implements four estimators for discrete data: 
			    "mi.empirical", "mi.mm", "mi.shrink", "mi.sg" (default:"mi.empirical") - see details.
			    "pearson", "spearman" and "kendall" can be used  for continuous data but in that case 
			     build.mim computes the rho-square matrix.  This matrix leads to the same networks than those based on mutual information if the variables are normally distributed.
			     }
  \item{disc}{ The name of the discretization method to be used :"equalfreq", "equalwidth" or "globalequalwidth" (default : "equalfreq") - see infotheo package.}
  \item{nbins}{ Integer specifying the number of bins to be used for the discretization if disc is set properly. By default the number of bins is set to 
			  \eqn{\sqrt{N}}{sqrt(N)} where N is the number of samples.}

}
\value{ \code{build.mim} returns the mutual information matrix.}
\description{
	  \code{build.mim} takes the dataset as input and computes the 
	  mutual information beetween all pair of variables according 
	  to the mutual inforamtion estimator \code{estimator}. 
	  The results are saved in the mutual information matrix (MIM), a square 
      matrix whose (i,j) element is the mutual information between variables
      \eqn{X_i}{Xi} and \eqn{X_j}{Xj}. 
}
\details{
\itemize{
      \item "mi.empirical" : This estimator computes the entropy of the empirical probability distribution.
      \item "mi.mm" : This is the Miller-Madow asymptotic bias corrected empirical estimator.
      \item "mi.shrink" : This is a shrinkage estimate of the entropy of a Dirichlet probability distribution.
	  \item "mi.sg" : This is the Schurmann-Grassberger estimate of the entropy of a Dirichlet probability distribution.
	  \item "pearson" : This approximates a normalized mutual information by squaring Pearson's correlation
	  \item "spearman" : This approximates a normalized mutual information by squaring Spearman's correlation
	  \item "kendall" : This approximates a normalized mutual information by squaring Kendall's correlation
}
}
\author{
  Patrick E. Meyer, Frederic Lafitte, Gianluca Bontempi
}
\references{
  Patrick E. Meyer, Frederic Lafitte, and Gianluca Bontempi. 
 minet: A R/Bioconductor Package for Inferring Large Transcriptional Networks Using Mutual Information. BMC Bioinformatics, Vol 9,
 2008.
 
 J. Beirlant, E. J. Dudewica, L. Gyofi, and E. van der Meulen. Nonparametric 
 entropy estimation : An overview. Journal of Statistics, 1997.

 Jean Hausser. Improving entropy estimation and the inference of genetic regulatory networks.
 Master thesis of the National Institute of Applied Sciences of Lyon, 2006.
}
\seealso{\code{\link{clr}},   \code{\link{aracne}},   \code{\link{mrnet}}}
\examples{
  data(syn.data)
  mim <- build.mim(syn.data,estimator="spearman")
}
\keyword{misc}
