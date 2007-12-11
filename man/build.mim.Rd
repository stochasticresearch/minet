\name{build.mim}
\alias{build.mim}

\title{Build Mutual Information Matrix}
\usage{build.mim(data, mi.est="empirical")}
\arguments{
  \item{data}{Gene expression dataset or any dataset where columns contain variables/features and rows contain outcomes/samples.}
  \item{mi.est}{Mutual information estimator. The package implements four estimators : "gaussian", "empirical", "shrink", "millermadow" (default:"empirical") - see details. 
                The data must be discrete in order to use empirical, shrink or miller-madow estimators - see \code{\link{disc}}.}
}
\value{ \code{build.mim} returns the mutual information matrix.}
\description{
      The inference methods implemented in this package require at first 
      the computation of the mutual information matrix (MIM), a square 
      matrix whose (i,j) element is the mutual information between variables
      \eqn{X_i}{Xi} and \eqn{X_j}{Xj}. \code{build.mim} returns the MIM 
      according to the mutual information estimator \code{mi.est}.
}
\details{
      \item "gaussian" : This estimator assumes normally distributed variables.
      \item "empirical" : This estimator computes the entropy of the empirical probability distribution.
      \item "millermadow" : This is the Miller-Madow asymptotic bias corrected empirical estimator.
      \item "shrink" : This is a shrinkage estimate of the entropy of a Dirichlet probability distribution.
}
\author{
  P.E.Meyer, F.Lafitte, G.Bontempi
}
\references{
 Patrick E. Meyer, Kevin Kontos, Frederic Lafitte, and Gianluca Bontempi.
 Information-theoretic inference of large transcriptional regulatory
 networks. EURASIP Journal on Bioinformatics and Systems Biology,
 2007.
 
 J. Beirlant, E. J. Dudewica, L. Gyofi, and E. van der Meulen. Nonparametric 
 entropy estimation : An overview. Journal of Statistics, 1997.

 Jean Hausser. Improving entropy estimation and the inference of genetic regulatory networks.
 Master thesis of the National Institute of Applied Sciences of Lyon, 2006.
}
\seealso{\code{\link{clr.net}},   \code{\link{aracne.net}},   \code{\link{mr.net}}}
\examples{
data(syn.data)
estimator="empirical"
nb.bins = sqrt(nrow(syn.data))
mim <- build.mim(disc(syn.data,nbins=nb.bins),estimator)
}
\keyword{misc}
