% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\docType{data}
\name{vars_mh_p_abcl__synd__tho}
\alias{vars_mh_p_abcl__synd__tho}
\alias{compute_mh_p_abcl__synd__tho_nm}
\title{Compute "Adult Behavior Checklist [Parent] (Syndrome Scale - Thought
problems): Number missing"}
\format{
\code{vars_mh_p_abcl__synd__tho} is vector of all column names
used to compute summary score of \code{mh_p_abcl__synd__tho} scores.
}
\usage{
vars_mh_p_abcl__synd__tho

compute_mh_p_abcl__synd__tho_nm(
  data,
  name = "mh_p_abcl__synd__tho_nm",
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
Computes the summary score \code{mh_p_abcl__synd__tho_nm}
Adult Behavior Checklist [Parent] (Syndrome Scale - Thought problems):
Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_abcl__tho_001}
\item \code{mh_p_abcl__tho_002}
\item \code{mh_p_abcl__tho_003}
\item \code{mh_p_abcl__tho_004}
\item \code{mh_p_abcl__tho_005}
\item \code{mh_p_abcl__tho_006}
\item \code{mh_p_abcl__tho_007}
\item \code{mh_p_abcl__tho__dep_001}
\item \code{mh_p_abcl__tho__dep_002}
}
}
}
\examples{
\dontrun{
compute_mh_p_abcl__synd__tho_nm(data) |>
  select(
    any_of(c("mh_p_abcl__synd__tho_nm", vars_mh_p_abcl__synd__tho))
  )
}
}
\keyword{datasets}
