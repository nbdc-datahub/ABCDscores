% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\name{compute_mh_y_erq__reapp_nm}
\alias{compute_mh_y_erq__reapp_nm}
\title{Compute "Emotion Regulation Questionnaire [Youth] (Reappraisal): Number
missing"}
\usage{
compute_mh_y_erq__reapp_nm(
  data,
  name = "mh_y_erq__reapp_nm",
  exclude = c("777"),
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
Computes the summary score \code{mh_y_erq__reapp_nm}
Emotion Regulation Questionnaire [Youth] (Reappraisal): Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_erq__reapp_001}
\item \code{mh_y_erq__reapp_002}
\item \code{mh_y_erq__reapp_003}
}
}
}
\examples{
\dontrun{
compute_mh_y_erq__reapp_nm(data) |>
  select(
    any_of(c("mh_y_erq__reapp_nm", vars_mh_y_erq__reapp))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_erq__reapp_mean]{compute_mh_y_erq__reapp_mean()}}
}
