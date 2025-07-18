% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\docType{data}
\name{vars_fc_p_nce}
\alias{vars_fc_p_nce}
\alias{compute_fc_p_nce_mean}
\title{Compute "Neighborhood Collective Efficacy [Parent]: Mean"}
\format{
vars_fc_p_nce is a character vector of all column names
used to compute summary score of \code{fc_p_nce}.
}
\usage{
vars_fc_p_nce

compute_fc_p_nce_mean(data, name = "fc_p_nce_mean", max_na = 2, combine = TRUE)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score. Default is the name in
the description.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed (Default: 2).}

\item{combine}{logical. If \code{TRUE}, the summary score is appended to the
input data frame. If \code{FALSE}, the summary score is returned as a separate
data frame. Default is \code{TRUE}.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{fc_p_nce_mean}
(Neighborhood Collective Efficacy [Parent]: Mean)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_p_nce__cc_001}
\item \code{fc_p_nce__cc_002}
\item \code{fc_p_nce__cc_003}
\item \code{fc_p_nce__cc_004}
\item \code{fc_p_nce__cc_005}
\item \code{fc_p_nce__isc_001}
\item \code{fc_p_nce__isc_002}
\item \code{fc_p_nce__isc_003}
\item \code{fc_p_nce__isc_004}
\item \code{fc_p_nce__isc_005}
}
\item \emph{Excluded values:}
\itemize{
\item 777
}
\item \emph{Validation criterion:} maximally 2 of 10 items missing
\item \emph{Notes:}
\itemize{
\item The following variables are reverse coded before computing the summary
score:
\itemize{
\item \code{fc_p_nce__cc_003}
\item \code{fc_p_nce__cc_004}
}
\item The value "99" (Don't know) is recoded to "3" (Neither... nor...)
}
}
}
\keyword{datasets}
