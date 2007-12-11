\name{aracne.net}
\alias{aracne.net}

\title{Algorithm for the Reconstruction of Accurate Cellular NEtworks}
\usage{aracne.net( mim, eps=0 )}
\arguments{
  \item{mim}{the mutual information matrix - see \code{\link{build.mim}}.}
  \item{eps}{for each triplet of nodes (i,j,k), the weakest edge, say (ij), is removed if its 
              weight is below min\{(ik),(jk)\}-eps - see references. }
}
\value{
      \code{aracne.net} returns a matrix which is the weighted adjacency matrix of the network.
       In order to display the network, load the package Rgraphviz and use the following command: \cr
          plot( as( returned.matrix ,"graphNEL") )
}
\description{
      The Aracne algorithm applies the data processing inequality to 
      all triplets of nodes in order to remove the least significant 
      edge in each triplet.
}
\details{
      The Aracne procedure starts by assigning to each pair of
      nodes a weight equal to their mutual information. Then, 
      the weakest edge of each triplet is interpreted as an indirect interaction and is
      removed if the difference between the two lowest weights is
      above a threshold \code{eps}.
}
\references{
 Adam A. Margolin, Ilya Nemenman, Katia Basso, Chris Wiggins, Gustavo
 Stolovitzky, Riccardo Dalla Favera, and Andrea Califano. Aracne : An 
 algorithm for the reconstruction of gene regulatory networks in a mammalian
 cellular context. BMC Bioinformatics, 2006.
}
\seealso{\code{\link{build.mim}},   \code{\link{clr.net}},    \code{\link{mr.net}}}
\examples{
data(bcell)
mim <- build.mim(disc(bcell))
net <- aracne.net(mim)
}
\keyword{misc}
