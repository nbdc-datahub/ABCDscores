% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh_aseba.R
\name{compute_mh_p_abcl__su__drunk_sum}
\alias{compute_mh_p_abcl__su__drunk_sum}
\title{Compute "Adult Behavior Checklist [Parent] (Days Drunk): Sum"}
\usage{
compute_mh_p_abcl__su__drunk_sum(
  data,
  name = "mh_p_abcl__su__drunk_sum",
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
Computes the summary score \code{mh_p_abcl__su__drunk_sum}
Adult Behavior Checklist [Parent] (Days Drunk): Sum
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_abcl__drunk_001}
}
}
}
\examples{
\dontrun{
compute_mh_p_abcl__su__drunk_sum(data) |>
  select(
    any_of(c("mh_p_abcl__su__drunk_sum", vars_mh_p_abcl__su__drunk))
  )
}
}
\seealso{
\code{\link[=compute_mh_p_abcl__su__drunk_nm]{compute_mh_p_abcl__su__drunk_nm()}}
}
