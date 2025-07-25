% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_ph.R
\name{compute_ph_y_mctq__fd__sleep_inertia}
\alias{compute_ph_y_mctq__fd__sleep_inertia}
\title{Compute "Munich Chronotype Questionnaire [Youth] (Free Day - Sleep):
Inertia"}
\usage{
compute_ph_y_mctq__fd__sleep_inertia(
  data,
  name = "ph_y_mctq__fd__sleep_inertia",
  combine = TRUE
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the new column to be created (Default:
the name used in the ABCD data release).}

\item{combine}{logical. If TRUE, the new column will be bound to the input
data frame. If FALSE, the new column will be created as a new data frame.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{ph_y_mctq__fd__sleep_inertia}
Munich Chronotype Questionnaire [Youth] (Free Day - Sleep): Inertia
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{ph_y_mctq__fd_006}
}
}
}
\examples{
\dontrun{
data <- compute_ph_y_mctq__fd__sleep_inertia(data)
select(
  data,
  any_of(c(
    "ph_y_mctq__fd_006",
    "ph_y_mctq__fd__sleep_inertia"
  ))
)
}
}
