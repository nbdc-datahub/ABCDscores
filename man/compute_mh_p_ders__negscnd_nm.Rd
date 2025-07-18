% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\name{compute_mh_p_ders__negscnd_nm}
\alias{compute_mh_p_ders__negscnd_nm}
\title{Compute "Difficulties in Emotion Regulation Scale [Parent] (Negative
Secondary): Number missing"}
\usage{
compute_mh_p_ders__negscnd_nm(
  data,
  name = "mh_p_ders__negscnd_nm",
  exclude = c("999", "777"),
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
Computes the summary score \code{mh_p_ders__negscnd_nm}
Difficulties in Emotion Regulation Scale [Parent] (Negative
Secondary): Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_ders__negscnd_001}
\item \code{mh_p_ders__negscnd_002}
\item \code{mh_p_ders__negscnd_003}
\item \code{mh_p_ders__negscnd_004}
\item \code{mh_p_ders__negscnd_005}
\item \code{mh_p_ders__negscnd_006}
\item \code{mh_p_ders__negscnd_007}
}
}
}
\examples{
\dontrun{
compute_mh_p_ders__negscnd_nm(data) |>
  select(
    any_of(c("mh_p_ders__negscnd_nm", vars_mh_p_ders__negscnd))
  )
}
}
\seealso{
\code{\link[=compute_mh_p_ders__negscnd_mean]{compute_mh_p_ders__negscnd_mean()}}
}
