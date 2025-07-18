% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\name{compute_mh_y_pps__bother__yes_count}
\alias{compute_mh_y_pps__bother__yes_count}
\title{Compute "Prodromal Psychosis Scale [Youth] (Bother "Yes" responses): Count"}
\usage{
compute_mh_y_pps__bother__yes_count(
  data,
  name = "mh_y_pps__bother__yes_count",
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
Computes the summary score \code{mh_y_pps__bother__yes_count}
Prodromal Psychosis Scale [Youth] (Bother
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_y_pps__bother_001}
\item \code{mh_y_pps__bother_002}
\item \code{mh_y_pps__bother_003}
\item \code{mh_y_pps__bother_004}
\item \code{mh_y_pps__bother_005}
\item \code{mh_y_pps__bother_006}
\item \code{mh_y_pps__bother_007}
\item \code{mh_y_pps__bother_008}
\item \code{mh_y_pps__bother_009}
\item \code{mh_y_pps__bother_010}
\item \code{mh_y_pps__bother_011}
\item \code{mh_y_pps__bother_012}
\item \code{mh_y_pps__bother_013}
\item \code{mh_y_pps__bother_014}
\item \code{mh_y_pps__bother_015}
\item \code{mh_y_pps__bother_016}
\item \code{mh_y_pps__bother_017}
\item \code{mh_y_pps__bother_018}
\item \code{mh_y_pps__bother_019}
\item \code{mh_y_pps__bother_020}
\item \code{mh_y_pps__bother_021}
}
}
}
\details{
The bother count is depend on the \code{mh_y_pps__bother_nm} score. If the
\code{mh_y_pps__bother_nm} score is greater than \code{max_na}, the bother count
is set to \code{NA}.

There is also a sanity check for the gating question in PPS bother score.
If the paired gating question is 0 or \code{NA} and the bother score is not
missing, the paired bother score is set to \code{NA} before computing the count.
}
\examples{
\dontrun{
compute_mh_y_pps__bother__yes_count(data) |>
  select(
    any_of(c("mh_y_pps__bother__yes_count", vars_mh_y_pps__bother))
  )
}
}
\seealso{
\code{\link[=compute_mh_y_pps__bother_nm]{compute_mh_y_pps__bother_nm()}}
}
