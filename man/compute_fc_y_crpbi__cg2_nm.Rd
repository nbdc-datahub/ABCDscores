% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_fc.R
\name{compute_fc_y_crpbi__cg2_nm}
\alias{compute_fc_y_crpbi__cg2_nm}
\title{Compute "Children's Report of Parental Behavioral Inventory [Youth]
(Caregiver B): Number missing"}
\usage{
compute_fc_y_crpbi__cg2_nm(data, name = "fc_y_crpbi__cg2_nm", combine = TRUE)
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. Name of the summary score. Default is the name in
the description.}

\item{combine}{logical. If \code{TRUE}, the summary score is appended to the
input data frame. If \code{FALSE}, the summary score is returned as a separate
data frame. Default is \code{TRUE}.}
}
\value{
tbl. The input data frame with the summary score appended as
a new column.
}
\description{
Computes the summary score \code{fc_y_crpbi__cg2_nm}
(Children's Report of Parental Behavioral Inventory [Youth] (Caregiver B):
Number missing)
\itemize{
\item \emph{Summarized variables:}
\itemize{
\item \code{fc_y_crpbi__cg2_002}
\item \code{fc_y_crpbi__cg2_003}
\item \code{fc_y_crpbi__cg2_004}
\item \code{fc_y_crpbi__cg2_005}
\item \code{fc_y_crpbi__cg2_006}
}
\item \emph{Excluded values:} none
}
}
\seealso{
\code{\link[=compute_fc_y_crpbi__cg2_mean]{compute_fc_y_crpbi__cg2_mean()}}
}
