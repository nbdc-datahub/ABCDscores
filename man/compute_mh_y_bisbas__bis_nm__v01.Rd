% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\docType{data}
\name{vars_mh_y_bisbas__bis__v01}
\alias{vars_mh_y_bisbas__bis__v01}
\alias{compute_mh_y_bisbas__bis_nm__v01}
\title{Compute "The Behavioral Inhibition System/Behavioral Activation System
Scales [Youth] (BIS (modified)): Number missing"}
\format{
\code{vars_mh_y_bisbas__bis__v01} is vector of all column names
used to compute summary score of \code{mh_y_bisbas__bis__v01} scores.
}
\usage{
vars_mh_y_bisbas__bis__v01

compute_mh_y_bisbas__bis_nm__v01(
  data,
  name = "mh_y_bisbas__bis_nm__v01",
  exclude = NULL,
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
Computes the summary score \code{mh_y_bisbas__bis_nm__v01}
The Behavioral Inhibition System/Behavioral Activation System Scales
[Youth] (BIS (modified)): Number missing
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_bisbas__bis_002}
\item \code{mh_y_bisbas__bis_003}
\item \code{mh_y_bisbas__bis_004}
\item \code{mh_y_bisbas__bis_006}
}
}
}
\examples{
\dontrun{
compute_mh_y_bisbas__bis_nm__v01(data) |>
  select(
    any_of(c("mh_y_bisbas__bis_nm__v01", vars_mh_y_bisbas__bis__v01))
  )
}
}
\keyword{datasets}
