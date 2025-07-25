% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\name{compute_fc_y_vs__obl_nm}
\alias{compute_fc_y_vs__obl_nm}
\title{Compute "Values Scale [Youth] (Family obligation):
Number missing"}
\usage{
compute_fc_y_vs__obl_nm(data, name = "fc_y_vs__obl_nm", combine = TRUE)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score. Default is the name in
the description.}

\item{combine}{logical. If \code{TRUE}, the summary score is appended to the
input data frame. If \code{FALSE}, the summary score is returned as a separate
data frame. Default is \code{TRUE}.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{fc_y_vs__obl_nm}
(Values Scale [Youth] (Family obligation): Number
missing)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_y_vs__obl_001}
\item \code{fc_y_vs__obl_002}
\item \code{fc_y_vs__obl_003}
\item \code{fc_y_vs__obl_004}
\item \code{fc_y_vs__obl_005}
}
\item \emph{Excluded values:} none
}
}
\seealso{
\code{\link[=compute_fc_y_vs__obl_mean]{compute_fc_y_vs__obl_mean()}}
}
