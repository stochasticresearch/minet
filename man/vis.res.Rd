
\name{vis.res}
\alias{vis.res}
\alias{pr}
\alias{rates}
\alias{fscores}
\alias{show.pr}
\alias{show.roc}
\title{Visualize Results}

\description{
  A group of functions to plot precision-recall and ROC curves and to compute f-scores from the 
  data frame returned by the \code{\link{validate}} function.
}
\usage{
  pr(table)
  rates(table)
  fscores(table, beta=1)
  show.pr(table,device=-1,...)
  show.roc(table,device=-1,...)
}

\arguments{
  \item{table}{This is a (\code{steps} x 5) matrix where \code{steps} is the number of thresholds used in the 
      validation process and where columns contain TP,FP,TN,FN values (confusion matrix) as well as the threshold
      value used  - see \code{\link{validate}}.}
  \item{beta}{This is the weight of the recall in the f-score formula. Default: 1 (meaning precision as 
      important as recall).}
  \item{device}{The device to be used. This parameter allows the user to plot the 
      results of various inferences on the same plotting window - see examples.}
  \item{...}{ arguments passed to \code{plot} }
}
\value{
  The functions \code{show.roc} (\code{show.pr}) plots the ROC-curve (PR-curve) and returns the device used for the plot.
  
  The function \code{pr} returns a (\code{steps} x 2) matrix where steps is the number of thresholds used 
  in the validation process. The first column contains precisions and the second recalls.
  
  The function \code{rates} also returns a (\code{steps} x 2) matrix where the first column contains true 
  positive rates and the second column false positive rates.  

  The function \code{fscores} returns \code{steps} fscores according to the \code{steps} confusion matrices 
  contained in the 'table' argument.
}

\seealso{\code{\link{validate}},  \code{\link{plot}}}
\references{
 Patrick E. Meyer, Kevin Kontos, Frederic Lafitte, and Gianluca Bontempi. 
 Information-theoretic inference of large transcriptional regulatory
 networks. EURASIP Journal on Bioinformatics and Systems Biology,
 2007.    
}
\examples{
data(syn.data)
data(syn.net)
# Inference
mr <- minet( syn.data, method="mrnet", estimator="empirical" )
ar <- minet( syn.data, method="aracne", estimator="empirical" )
clr<- minet( syn.data, method="clr", estimator="empirical" )
# Validation
mr.tbl <- validate(mr,syn.net)
ar.tbl <- validate(ar,syn.net)
clr.tbl<- validate(clr,syn.net)
# Plot PR-Curves
max(fscores(mr.tbl))
dev <- show.pr(mr.tbl, col="green", type="b")
dev <- show.pr(ar.tbl, device=dev, col="blue", type="b")
show.pr(clr.tbl, device=dev, col="red",type="b")
}
\keyword{misc}

