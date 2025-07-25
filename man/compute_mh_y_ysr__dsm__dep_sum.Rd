% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\name{compute_mh_y_ysr__dsm__dep_sum}
\alias{compute_mh_y_ysr__dsm__dep_sum}
\title{Compute "Youth Self Report [Youth] (DSM-5 Oriented Scale - Depressive
problems): Sum"}
\usage{
compute_mh_y_ysr__dsm__dep_sum(
  data,
  name = "mh_y_ysr__dsm__dep_sum",
  max_na = 0,
  exclude = c("777", "999"),
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score column.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed. \code{NULL} means no limit.}

\item{exclude}{character vector. Values to be excluded from the summary score.}

\item{combine}{logical. If \code{TRUE} (default), the summary score is
is appended as a new column to the input data frame. If \code{FALSE}, the
summary score is returned as a separate one-column data frame.}
}
\value{
tbl. see \code{combine}.
}
\description{
Computes the summary score \code{mh_y_ysr__dsm__dep_sum}
Youth Self Report [Youth] (DSM-5 Oriented Scale - Depressive
problems): Sum
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_ysr__wthdep__dep_001}
\item \code{mh_y_ysr__anxdep__dep_001}
\item \code{mh_y_ysr__tho__dep_001}
\item \code{mh_y_ysr__othpr__dep_001}
\item \code{mh_y_ysr__anxdep__dep_002}
\item \code{mh_y_ysr__anxdep__dep_003}
\item \code{mh_y_ysr__som__dep_001}
\item \code{mh_y_ysr__tho__dep_002}
\item \code{mh_y_ysr__othpr__dep_002}
\item \code{mh_y_ysr__anxdep__dep_004}
\item \code{mh_y_ysr__tho__dep_003}
\item \code{mh_y_ysr__wthdep__dep_002}
\item \code{mh_y_ysr__wthdep__dep_003}
}
}
}
\examples{
\dontrun{
compute_mh_y_ysr__dsm__dep_sum(data) |>
  select(
    any_of(c("mh_y_ysr__dsm__dep_sum", vars_mh_y_ysr__dsm__dep))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_ysr__dsm__dep_nm]{compute_mh_y_ysr__dsm__dep_nm()}}
}
