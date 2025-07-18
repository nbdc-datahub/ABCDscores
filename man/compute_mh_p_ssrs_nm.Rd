% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\docType{data}
\name{vars_mh_p_ssrs}
\alias{vars_mh_p_ssrs}
\alias{compute_mh_p_ssrs_nm}
\title{Compute "Short Social Responsiveness Scale [Parent]: Number missing"}
\format{
\code{vars_mh_p_ssrs} is vector of all column names
used to compute summary score of \code{mh_p_ssrs} scores.
}
\usage{
vars_mh_p_ssrs

compute_mh_p_ssrs_nm(
  data,
  name = "mh_p_ssrs_nm",
  exclude = NULL,
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score column.}

\item{exclude}{character vector. Values to be excluded from the summary
score calculation.}

\item{combine}{logical. If \code{TRUE} (default), the summary score is
is appended as a new column to the input data frame. If \code{FALSE}, the
summary score is returned as a separate one-column data frame.}
}
\value{
tbl. see \code{combine}.
}
\description{
Computes the summary score \code{mh_p_ssrs_nm}
Short Social Responsiveness Scale [Parent]: Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_ssrs_001}
\item \code{mh_p_ssrs_002}
\item \code{mh_p_ssrs_003}
\item \code{mh_p_ssrs_004}
\item \code{mh_p_ssrs_005}
\item \code{mh_p_ssrs_006}
\item \code{mh_p_ssrs_007}
\item \code{mh_p_ssrs_008}
\item \code{mh_p_ssrs_009}
\item \code{mh_p_ssrs_010}
\item \code{mh_p_ssrs_011}
}
}
}
\examples{
\dontrun{
compute_mh_p_ssrs_nm(data) |>
  select(
    any_of(c("mh_p_ssrs_nm", vars_mh_p_ssrs))
  )
}
}
\keyword{datasets}
