% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\docType{data}
\name{vars_fc_p_vs__obl}
\alias{vars_fc_p_vs__obl}
\alias{compute_fc_p_vs__obl_mean}
\title{Compute "Values Scale [Parent] (Family obligation):
Mean"}
\format{
vars_fc_p_vs__obl is a character vector of all column names
used to compute summary score of \code{fc_p_vs__obl}.
}
\usage{
vars_fc_p_vs__obl

compute_fc_p_vs__obl_mean(
  data,
  name = "fc_p_vs__obl_mean",
  max_na = 1,
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score. Default is the name in the
description.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed (Default: 1).}

\item{combine}{logical. If \code{TRUE}, the summary score is appended to the input
data frame. If \code{FALSE}, the summary score is returned as a separate data
frame. Default is \code{TRUE}.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{fc_p_vs__obl_mean}
(Values Scale [Parent] (Family obligation): Mean)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_p_vs__obl_001}
\item \code{fc_p_vs__obl_002}
\item \code{fc_p_vs__obl_003}
\item \code{fc_p_vs__obl_004}
\item \code{fc_p_vs__obl_005}
}
\item \emph{Excluded values:} none
\item \emph{Validation criterion:} maximally 1 of 5 items missing
}
}
\keyword{datasets}
