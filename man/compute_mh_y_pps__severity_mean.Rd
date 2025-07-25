% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\name{compute_mh_y_pps__severity_mean}
\alias{compute_mh_y_pps__severity_mean}
\title{Compute "Prodromal Psychosis Scale [Youth] (Severity Score): Mean"}
\usage{
compute_mh_y_pps__severity_mean(
  data,
  name = "mh_y_pps__severity_mean",
  max_na = 0,
  combine = TRUE
)
}
\arguments{
\item{data}{tbl, Dataframe containing the columns to be summarized.}

\item{name}{character, Name of the new column to be created. Default is
the name in description, but users can change it.}

\item{max_na}{integer, Maximum number of missing values allowed in the
summary score.}

\item{combine}{logical, If \code{TRUE}, the summary score will be appended to
the input data frame. If \code{FALSE}, the summary score will be returned as a
separate data frame.}
}
\description{
Computes the summary score \code{mh_y_pps__severity_mean}
Prodromal Psychosis Scale [Youth] (Severity Score): Mean
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_pps_001}
\item \code{mh_y_pps_002}
\item \code{mh_y_pps_003}
\item \code{mh_y_pps_004}
\item \code{mh_y_pps_005}
\item \code{mh_y_pps_006}
\item \code{mh_y_pps_007}
\item \code{mh_y_pps_008}
\item \code{mh_y_pps_009}
\item \code{mh_y_pps_010}
\item \code{mh_y_pps_011}
\item \code{mh_y_pps_012}
\item \code{mh_y_pps_013}
\item \code{mh_y_pps_014}
\item \code{mh_y_pps_015}
\item \code{mh_y_pps_016}
\item \code{mh_y_pps_017}
\item \code{mh_y_pps_018}
\item \code{mh_y_pps_019}
\item \code{mh_y_pps_020}
\item \code{mh_y_pps_021}
\item \code{mh_y_pps__severity_001}
\item \code{mh_y_pps__severity_002}
\item \code{mh_y_pps__severity_003}
\item \code{mh_y_pps__severity_004}
\item \code{mh_y_pps__severity_005}
\item \code{mh_y_pps__severity_006}
\item \code{mh_y_pps__severity_007}
\item \code{mh_y_pps__severity_008}
\item \code{mh_y_pps__severity_009}
\item \code{mh_y_pps__severity_010}
\item \code{mh_y_pps__severity_011}
\item \code{mh_y_pps__severity_012}
\item \code{mh_y_pps__severity_013}
\item \code{mh_y_pps__severity_014}
\item \code{mh_y_pps__severity_015}
\item \code{mh_y_pps__severity_016}
\item \code{mh_y_pps__severity_017}
\item \code{mh_y_pps__severity_018}
\item \code{mh_y_pps__severity_019}
\item \code{mh_y_pps__severity_020}
\item \code{mh_y_pps__severity_021}
}
}
}
\details{
The mean severity score is calculated by dividing the total severity
score by the number of \code{mh_y_pps__bother__yes_count}. If any of the
two values is missing, the mean severity score is set to \code{NA}.
}
\examples{
\dontrun{
compute_mh_y_pps__severity_mean(data) |>
  select(
    any_of(c("mh_y_pps__severity_mean", vars_mh_y_pps__severity))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_pps__bother__yes_count]{compute_mh_y_pps__bother__yes_count()}}
}
