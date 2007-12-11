\docType{data}
\name{bcell}
\alias{bcell}

\title{Human B Cell Dataset}
\description{ Dataset containing 10 genes (columns) and 672 samples (rows). }
\usage{data(bcell)}
\format{
 \code{bcell} is a data frame containing 10 genes (columns) and 672 samples (rows).
}
\references{
Adam A Margolin, Kai Wang, Wei Keat Lim, Manjunath Kustagi, Ilya Nemenman & Andrea Califano.
Reverse engineering cellular networks.
Nature Protocols 1, - 662 - 671 (2006)
}
\examples{
data(bcell)
mr <- minet( bcell, method="mrnet" )
}
\keyword{datasets}
