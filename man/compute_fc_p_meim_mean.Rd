% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\docType{data}
\name{vars_fc_p_meim}
\alias{vars_fc_p_meim}
\alias{compute_fc_p_meim_mean}
\title{Compute "The Multigroup Ethnic Identity Measure-Revised [Parent]: Mean"}
\format{
vars_fc_p_meim is a character vector of all column names
used to compute summary score of \code{fc_p_meim}.
}
\usage{
vars_fc_p_meim

compute_fc_p_meim_mean(
  data,
  name = "fc_p_meim_mean",
  max_na = 1,
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score. Default is the name in
the description.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed (Default: 1).}

\item{combine}{logical. If \code{TRUE}, the summary score is appended to the
input data frame. If \code{FALSE}, the summary score is returned as a separate
data frame. Default is \code{TRUE}.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{fc_p_meim_mean}
(The Multigroup Ethnic Identity Measure-Revised [Parent]: Mean)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_p_meim__commattach_001}
\item \code{fc_p_meim__commattach_002}
\item \code{fc_p_meim__commattach_003}
\item \code{fc_p_meim__explor_001}
\item \code{fc_p_meim__explor_002}
\item \code{fc_p_meim__explor_003}
}
\item \emph{Excluded values:} none
\item \emph{Validation criterion:} maximally 1 of 6 items missing
}
}
\keyword{datasets}
