% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_mh.R
\docType{data}
\name{vars_mh_p_eatq__affl}
\alias{vars_mh_p_eatq__affl}
\alias{compute_mh_p_eatq__affl_mean}
\title{Compute "Early Adolescent Temperament Questionnaire [Parent] (Affiliation):
Mean"}
\format{
vars_mh_p_eatq__affl is a character vector of all column names
used to compute summary score of \code{mh_p_eatq__affl_mean}.
}
\usage{
vars_mh_p_eatq__affl

compute_mh_p_eatq__affl_mean(
  data,
  name = "mh_p_eatq__affl_mean",
  max_na = 1,
  combine = TRUE,
  revert = FALSE
)
}
\arguments{
\item{data}{tbl, Dataframe containing the columns to be summarized.}

\item{name}{character, Name of the new column to be created. Default is
the name in description, but users can change it.}

\item{max_na}{integer, Maximum number of missing values allowed in the
summary score. \code{NULL} means no limit.}

\item{combine}{logical, If \code{TRUE}, the summary score will be appended to
the input data frame. If \code{FALSE}, the summary score will be returned as a
separate data frame.}

\item{revert}{logical, If \code{TRUE}, the summary score will be reverse scored.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{mh_p_eatq__affl_mean}
Early Adolescent Temperament Questionnaire [Parent] (Affiliation):
Mean
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{mh_p_eatq__affl_001}
\item \code{mh_p_eatq__affl_002}
\item \code{mh_p_eatq__affl_003}
\item \code{mh_p_eatq__affl_004}
\item \code{mh_p_eatq__affl_005}
\item \code{mh_p_eatq__affl_006}
}
}
}
\examples{
\dontrun{
data <- compute_mh_p_eatq__affl_mean(data)
select(
  data,
  any_of(c("mh_p_eatq__affl_mean", vars_mh_p_eatq__affl))
)
}
}
\keyword{datasets}
