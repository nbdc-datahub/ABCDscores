% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\docType{data}
\name{vars_mh_p_asr__synd__wthdr}
\alias{vars_mh_p_asr__synd__wthdr}
\alias{compute_mh_p_asr__synd__wthdr_nm}
\title{Compute "Adult Self Report [Parent] (Syndrome Scale - Withdrawn): Number
missing"}
\format{
\code{vars_mh_p_asr__synd__wthdr} is vector of all column names
used to compute summary score of \code{mh_p_asr__synd__wthdr} scores.
}
\usage{
vars_mh_p_asr__synd__wthdr

compute_mh_p_asr__synd__wthdr_nm(
  data,
  name = "mh_p_asr__synd__wthdr_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score column.}

\item{exclude}{character vector. Values to be excluded from the summary score.}

\item{combine}{logical. If \code{TRUE} (default), the summary score is
is appended as a new column to the input data frame. If \code{FALSE}, the
summary score is returned as a separate one-column data frame.}
}
\value{
tbl. see \code{combine}.
}
\description{
Computes the summary score \code{mh_p_asr__synd__wthdr_nm}
Adult Self Report [Parent] (Syndrome Scale - Withdrawn): Number
missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_asr__wthdr_001}
\item \code{mh_p_asr__wthdr_002}
\item \code{mh_p_asr__wthdr_003}
\item \code{mh_p_asr__wthdr_004}
\item \code{mh_p_asr__wthdr__avoid_001}
\item \code{mh_p_asr__wthdr__avoid_002}
\item \code{mh_p_asr__wthdr__avoid_003}
\item \code{mh_p_asr__wthdr__avoid_004}
\item \code{mh_p_asr__wthdr__dep_001}
}
}
}
\examples{
\dontrun{
compute_mh_p_asr__synd__wthdr_nm(data) |>
  select(
    any_of(c("mh_p_asr__synd__wthdr_nm", vars_mh_p_asr__synd__wthdr))
  )
}
}
\keyword{datasets}
