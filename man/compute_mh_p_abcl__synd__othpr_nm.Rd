% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\docType{data}
\name{vars_mh_p_abcl__synd__othpr}
\alias{vars_mh_p_abcl__synd__othpr}
\alias{compute_mh_p_abcl__synd__othpr_nm}
\title{Compute "Adult Behavior Checklist [Parent] (Syndrome Scale - Other
problems): Number missing"}
\format{
\code{vars_mh_p_abcl__synd__othpr} is vector of all column names
used to compute summary score of \code{mh_p_abcl__synd__othpr} scores.
}
\usage{
vars_mh_p_abcl__synd__othpr

compute_mh_p_abcl__synd__othpr_nm(
  data,
  name = "mh_p_abcl__synd__othpr_nm",
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
Computes the summary score \code{mh_p_abcl__synd__othpr_nm}
Adult Behavior Checklist [Parent] (Syndrome Scale - Other problems):
Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_abcl__othpr_001}
\item \code{mh_p_abcl__othpr_002}
\item \code{mh_p_abcl__othpr_003}
\item \code{mh_p_abcl__othpr_004}
\item \code{mh_p_abcl__othpr_005}
\item \code{mh_p_abcl__othpr_006}
\item \code{mh_p_abcl__othpr_007}
\item \code{mh_p_abcl__othpr_008}
\item \code{mh_p_abcl__othpr_009}
\item \code{mh_p_abcl__othpr_010}
\item \code{mh_p_abcl__othpr_011}
\item \code{mh_p_abcl__othpr_012}
\item \code{mh_p_abcl__othpr__adhd_001}
\item \code{mh_p_abcl__othpr__adhd_002}
\item \code{mh_p_abcl__othpr__adhd_003}
\item \code{mh_p_abcl__othpr__adhd_004}
\item \code{mh_p_abcl__othpr__antsoc_001}
\item \code{mh_p_abcl__othpr__antsoc_002}
\item \code{mh_p_abcl__othpr__anx_001}
\item \code{mh_p_abcl__othpr__anx_002}
\item \code{mh_p_abcl__othpr__anx_003}
\item \code{mh_p_abcl__othpr__avoid_001}
\item \code{mh_p_abcl__othpr__dep_001}
\item \code{mh_p_abcl__othpr__dep_002}
\item \code{mh_p_abcl__othpr__dep_003}
}
}
}
\examples{
\dontrun{
compute_mh_p_abcl__synd__othpr_nm(data) |>
  select(
    any_of(c("mh_p_abcl__synd__othpr_nm", vars_mh_p_abcl__synd__othpr))
  )
}
}
\keyword{datasets}
