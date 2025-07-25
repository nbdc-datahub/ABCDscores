% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_ph.R
\name{compute_ph_p_cna_all}
\alias{compute_ph_p_cna_all}
\title{Compute all the \code{ph_p_cna} summary scores}
\usage{
compute_ph_p_cna_all(data)
}
\arguments{
\item{data}{tbl. Dataframe containing the columns to be summarized.}
}
\value{
tbl. The input data frame with the summary scores appended as
new columns.
}
\description{
This is a high-level function that computes all summary scores in this table.
Make sure the \code{data} contains all the necessary columns.
}
\examples{
\dontrun{
compute_ph_p_cna(data)
}

}
