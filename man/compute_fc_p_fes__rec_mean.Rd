% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\docType{data}
\name{vars_fc_p_fes__rec}
\alias{vars_fc_p_fes__rec}
\alias{compute_fc_p_fes__rec_mean}
\title{Compute "Family Environment Scale [Parent] (Activity and recreational): Mean"}
\format{
vars_fc_p_fes__rec is a character vector of all column names
used to compute summary score of \code{fc_p_fes__rec}.
}
\usage{
vars_fc_p_fes__rec

compute_fc_p_fes__rec_mean(
  data,
  name = "fc_p_fes__rec_mean",
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
Computes the summary score \code{fc_p_fes__rec_mean}
(Family Environment Scale [Parent] (Activity and recreational): Mean)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_p_fes__rec_001}
\item \code{fc_p_fes__rec_002}
\item \code{fc_p_fes__rec_003}
\item \code{fc_p_fes__rec_004}
\item \code{fc_p_fes__rec_005}
\item \code{fc_p_fes__rec_006}
\item \code{fc_p_fes__rec_007}
\item \code{fc_p_fes__rec_008}
\item \code{fc_p_fes__rec_009}
}
\item \emph{Excluded values:} none
\item \emph{Validation criterion:} maximally 1 of 9 items missing
}
}
\keyword{datasets}
