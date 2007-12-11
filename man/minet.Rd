\name{minet}
\alias{minet}

\title{Mutual Information Network}
\usage{
minet(dataset, method="mrnet", estimator="empirical", 
      disc.method="equalfreq", nbins=sqrt(nrow(dataset)) )
}
\arguments{
  \item{dataset}{ Columns contain variables/features, rows contain outcomes/samples.}
  \item{method}{The package implements the following algorithms : clr, aracne, mrnet - see references.}
  \item{estimator}{ The package implements the following estimators : empirical, millermadow, shrink, gaussian - see \code{\link{build.mim}}.}
  \item{disc.method}{ Two discretization methods can be used : "equalfreq" or "equalwidth" - see \code{\link{disc}}.}
  \item{nbins}{ The number of bins to be used to discretize the data. }
}
\value{
\code{minet} returns a matrix which is the weighted adjacency matrix of the network. The weights range from 0 to 1 and can be seen
      as a confidence measure on the presence of the arcs.  In order to display the network, load the package Rgraphviz and use the following command: 
      \cr plot( as( returned.matrix ,"graphNEL") )
}
\description{
  For a given dataset, \code{minet} infers a network using the algorithm given by \code{method} on the mutual information matrix. 
  The mutual information between all pairs of variables in \code{dataset} is computed
  according to the \code{estimator} argument. 
}
\author{
  P.E.Meyer, F.Lafitte, G.Bontempi
}
\seealso{ \code{\link{build.mim}},  \code{\link{clr.net}},  \code{\link{mr.net}},  \code{\link{aracne.net}}  }
\references{
 Patrick E. Meyer, Kevin Kontos, Frederic Lafitte, and Gianluca Bontempi. 
 Information-theoretic inference of large transcriptional regulatory
 networks. EURASIP Journal on Bioinformatics and Systems Biology,
 2007.    

 Adam A. Margolin, Ilya Nemenman, Katia Basso, Chris Wiggins, Gustavo
 Stolovitzky, Riccardo Dalla Favera, and Andrea Califano. Aracne : An 
 algorithm for the reconstruction of gene regulatory networks in a mammalian
 cellular context. BMC Bioinformatics, 2006.

 Jeremiah J. Faith, Boris Hayete, Joshua T. Thaden, Ilaria Mogno, Jamey
 Wierzbowski, Guillaume Cottarel, Simon Kasif, James J. Collins, and 
 Timothy S. Gardner. Large-scale mapping and validation of escherichia coli
 transcriptional regulation from a compendium of expression profiles. PLoS
 Biology, 2007.
}     
\examples{
data(syn.data)
net1 <- minet( syn.data )
net2 <- minet( syn.data, estimator="shrink" )
net3 <- minet( syn.data, method="mrnet", estimator="gaussian" )
}
\keyword{misc}
