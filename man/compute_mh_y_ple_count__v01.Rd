% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\docType{data}
\name{vars_mh_y_ple__v01}
\alias{vars_mh_y_ple__v01}
\alias{compute_mh_y_ple_count__v01}
\title{Compute "Life Events [Youth] (Events): Count - Version 1 (Year 3)
[Validation: No more than 6 missing or declined]"}
\format{
vars_mh_y_ple__v01 is a character vector of all column names
used to compute summary score of \code{mh_y_ple}.
}
\usage{
vars_mh_y_ple__v01

compute_mh_y_ple_count__v01(
  data,
  name = "mh_y_ple_count__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the new column to be created (Default:
the name used in the ABCD data release).}

\item{events}{character vector. Event (session ID) to be used.}

\item{combine}{logical. If TRUE, the new column will be bound to the input
data frame. If FALSE, the new column will be created as a new data frame.}

\item{max_na}{numeric, positive whole number. Number of missing items
allowed (Default: 6).}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{mh_y_ple_count__v01}
Life Events [Youth] (Events): Count - Version 1 (Year 3) [Validation:
No more than 6 missing or declined]
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_ple_001}
\item \code{mh_y_ple_002}
\item \code{mh_y_ple_003}
\item \code{mh_y_ple_004}
\item \code{mh_y_ple_005}
\item \code{mh_y_ple_006}
\item \code{mh_y_ple_007}
\item \code{mh_y_ple_008}
\item \code{mh_y_ple_009}
\item \code{mh_y_ple_010}
\item \code{mh_y_ple_011}
\item \code{mh_y_ple_012}
\item \code{mh_y_ple_013}
\item \code{mh_y_ple_014}
\item \code{mh_y_ple_015}
\item \code{mh_y_ple_016}
\item \code{mh_y_ple_017}
\item \code{mh_y_ple_018}
\item \code{mh_y_ple_019}
\item \code{mh_y_ple_020}
\item \code{mh_y_ple_021}
\item \code{mh_y_ple_022}
\item \code{mh_y_ple_023}
\item \code{mh_y_ple_024}
\item \code{mh_y_ple_025}
\item \code{mh_y_ple_026}
\item \code{mh_y_ple_027}
\item \code{mh_y_ple_028}
\item \code{mh_y_ple_029}
\item \code{mh_y_ple_030}
\item \code{mh_y_ple_031}
}
\item \emph{Excluded values:}
\itemize{
\item 444
\item 777
\item 999
}
\item \emph{Validation criterion:} maximally 6 of 31 items missing
}
}
\keyword{datasets}
