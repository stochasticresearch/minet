
\name{validate}
\alias{validate}
\title{Inference Validation}

\description{
  \code{validate} compares the infered network to another network (usually the true underlying network) for several threshold values 
      and appends the resulting confusion matrix for each threshold to the returned object. 
}
\usage{
validate( inet, tnet, narcs=10 )
}
\arguments{
  \item{inet}{infered network - see \code{\link{minet}}.}.
  \item{tnet}{the true underlying network. This network must have the same size and variable names as \code{inet}.}
  \item{narcs}{the number of arcs to be added in the infered network before computing the confusion matrix (default: 10) - see \code{details}.}
}
\value{
  \code{validate} returns a data frame with four columns named tp, tn, fp, fn. These values are 
      computed each time \code{narcs} arcs are added to the infered network.
}
\details{
      For each of the \eqn{\frac{n^2}{narcs}}{n^2/narcs} threshold values \eqn{I_0}{T} (n is the number of variables/nodes), the edges whose weight 
      are (strictly) below \eqn{I_0}{T} are eliminated. All the other edges will have a weight 1. Each resulting graph 
      is compared to the true underlying network in order to get \eqn{\frac{n^2}{narcs}}{n^2/narcs} confusion matrices.
}
\seealso{ \code{\link{minet}}, \code{\link{vis.res}} }

\examples{
data(syn.data)
data(syn.net)
table <- validate( mr.net(build.mim(disc(syn.data))), syn.net, narcs=30 )
}
\keyword{misc}

