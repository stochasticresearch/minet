\name{disc}
\alias{disc}

\title{Unsupervized Data Discretization}
\usage{disc( data,disc.method="equalfreq",nbins=sqrt(nrow(data)) )}
\arguments{
  \item{data}{ The dataset to be discretized. The columns contains variables and the rows samples.}
  \item{disc.method}{ The package implements two discretization methods "equalfreq" and "equalwidth" (default : "equalfreq") - see references.}
  \item{nbins}{ The number of bins to be used for discretization. By default the number of bins is set to \eqn{\sqrt{N}}{sqrt(N)} where N 
                is the number of samples.}
}
\value{\code{disc} returns the discretized dataset.}
\description{
      \code{disc} discretizes \code{data} using the equal frequencies or equal width binning algorithm. 
}
\references{
      Supervised and unsupervised discretization of continuous features. J.Dougherty, R. Kohavi, M. Sahami.
      ICML, 1995.
}
\author{
  P.E.Meyer, F.Lafitte, G.Bontempi
}
\seealso{\code{\link{build.mim}}}
\examples{
data(syn.data)
ew.data <- disc(syn.data,"equalwidth")
ef.data <- disc(syn.data,"equalfreq")
}
\keyword{misc}
