% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\name{compute_mh_y_upps__pers_sum}
\alias{compute_mh_y_upps__pers_sum}
\title{Compute "Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
Urgency, Impulsive Behavior Scale (Short Version) [Youth] (Lack of
Perseverance (GSSF)): Sum"}
\usage{
compute_mh_y_upps__pers_sum(
  data,
  name = "mh_y_upps__pers_sum",
  max_na = 0,
  exclude = NULL,
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score column.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed. \code{NULL} means no limit.}

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
Computes the summary score \code{mh_y_upps__pers_sum}
Urgency, Premeditation, Perseverance, Sensation Seeking, Positive
Urgency, Impulsive Behavior Scale (Short Version) [Youth] (Lack of
Perseverance (GSSF)): Sum
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_upps__pers_001}
\item \code{mh_y_upps__pers_002}
\item \code{mh_y_upps__pers_003}
\item \code{mh_y_upps__pers_004}
}
}
}
\examples{
\dontrun{
compute_mh_y_upps__pers_sum(data) |>
  select(
    any_of(c("mh_y_upps__pers_sum", vars_mh_y_upps__pers))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_upps__pers_nm]{compute_mh_y_upps__pers_nm()}}
}
