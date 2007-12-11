
\name{validate}
\alias{validate}
\title{Inference Validation}

\description{
  \code{validate} compares the infered network to the true underlying network for several threshold values 
      and appends the resulting confusion matrix for each threshold to the returned object.     
}
\usage{
validate( inet, tnet, steps=50 )
}
\arguments{
  \item{inet}{infered network - see \code{\link{minet}}.}.
  \item{tnet}{the true underlying network. This network must have the same size and variable names as \code{inet}.}
  \item{steps}{the number of threshold values to be used in the validation process - see \code{details}.}
}
\value{
  \code{validate} returns a data frame whith four columns named \code{thrsh, tp, fp, fn}. These values are 
      computed for each of the \code{steps} thresholds. Thus each row of the returned object contains
      the confusion matrix for a different threshold.      
}
\details{
      For each of the \code{steps} threshold values \eqn{I_0}{T}, the edges whose weight are (strictly) 
      below \eqn{I_0}{T} are eliminated. All the other edges will have a weight 1. Each resulting graph 
      is compared to the true underlying network in order to get \code{steps} confusion matrices. 
}
\seealso{ \code{\link{minet}},   \code{\link{vis.res}} }

\examples{
data(syn.data)
data(syn.net)
inf.net <- mr.net(build.mim(disc(syn.data)))
table <- validate( inf.net, syn.net, steps=100 )
}
\keyword{misc}

