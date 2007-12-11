\docType{data}
\name{bcell}
\alias{bcell}

\title{Human B Cell Dataset}
\description{ Dataset containing 672 genes (columns) and 10 samples (rows). }
\usage{data(bcell)}
\format{
 \code{bcell} is a dataframe where rows contain microarray experiments and columns contain genes.
}
\references{
Adam A Margolin, Kai Wang, Wei Keat Lim, Manjunath Kustagi, Ilya Nemenman & Andrea Califano.
Reverse engineering cellular networks.
Nature Protocols 1, - 662 - 671 (2006)
}
\examples{
data(bcell)
mi.est="gaussian"
mim <- build.mim(bcell,mi.est)
}
\keyword{datasets}
