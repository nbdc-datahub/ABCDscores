% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\name{compute_mh_y_ysr__synd__wthdep_tscore}
\alias{compute_mh_y_ysr__synd__wthdep_tscore}
\title{Compute "Youth Self Report [Youth] (Syndrome Scale - Withdrawn/Depressed):
T-score"}
\usage{
compute_mh_y_ysr__synd__wthdep_tscore(
  data,
  data_norm = NULL,
  name = "mh_y_ysr__synd__wthdep_tscore",
  col_age = "mh_y_ysr_age",
  col_sex = "ab_g_stc__cohort_sex",
  max_na = 0,
  exclude = c("777", "999"),
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{data_norm}{tbl. Data frame containing the norm (T-score) values.
see \code{\link[=ss_tscore]{ss_tscore()}}.}

\item{name}{character. Name of the summary score column.}

\item{col_age}{character, name of the age column. see \code{\link[=ss_tscore]{ss_tscore()}}.}

\item{col_sex}{character, name of the sex column. see \code{\link[=ss_tscore]{ss_tscore()}}.}

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
Computes the summary score \code{mh_y_ysr__synd__wthdep_tscore}
Youth Self Report [Youth] (Syndrome Scale - Withdrawn/Depressed):
T-score
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_ysr__wthdep__dep_001}
\item \code{mh_y_ysr__wthdep_001}
\item \code{mh_y_ysr__wthdep_002}
\item \code{mh_y_ysr__wthdep_003}
\item \code{mh_y_ysr__wthdep_004}
\item \code{mh_y_ysr__wthdep__dep_002}
\item \code{mh_y_ysr__wthdep__dep_003}
\item \code{mh_y_ysr__wthdep_005}
}
}
}
\examples{
\dontrun{
compute_mh_y_ysr__synd__wthdep_tscore(data) |>
  select(
    any_of(c("mh_y_ysr__synd__wthdep_tscore", vars_mh_y_ysr__synd__wthdep))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_ysr__synd__wthdep_nm]{compute_mh_y_ysr__synd__wthdep_nm()}}
}
