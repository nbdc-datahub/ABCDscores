% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\docType{data}
\name{vars_mh_y_ysr__synd__anxdep}
\alias{vars_mh_y_ysr__synd__anxdep}
\alias{compute_mh_y_ysr__synd__anxdep_nm}
\title{Compute "Youth Self Report [Youth] (Syndrome Scale - Anxious/Depressed):
Number missing"}
\format{
\code{vars_mh_y_ysr__synd__anxdep} is vector of all column names
used to compute summary score of \code{mh_y_ysr__synd__anxdep} scores.
}
\usage{
vars_mh_y_ysr__synd__anxdep

compute_mh_y_ysr__synd__anxdep_nm(
  data,
  name = "mh_y_ysr__synd__anxdep_nm",
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
Computes the summary score \code{mh_y_ysr__synd__anxdep_nm}
Youth Self Report [Youth] (Syndrome Scale - Anxious/Depressed): Number
missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_ysr__anxdep__dep_001}
\item \code{mh_y_ysr__anxdep__anx_001}
\item \code{mh_y_ysr__anxdep__anx_002}
\item \code{mh_y_ysr__anxdep__anx_003}
\item \code{mh_y_ysr__anxdep_001}
\item \code{mh_y_ysr__anxdep_002}
\item \code{mh_y_ysr__anxdep__dep_002}
\item \code{mh_y_ysr__anxdep__anx_004}
\item \code{mh_y_ysr__anxdep__anx_005}
\item \code{mh_y_ysr__anxdep__dep_003}
\item \code{mh_y_ysr__anxdep__anx_006}
\item \code{mh_y_ysr__anxdep__dep_004}
\item \code{mh_y_ysr__anxdep__anx_007}
}
}
}
\examples{
\dontrun{
compute_mh_y_ysr__synd__anxdep_nm(data) |>
  select(
    any_of(c("mh_y_ysr__synd__anxdep_nm", vars_mh_y_ysr__synd__anxdep))
  )
}
}
\keyword{datasets}
