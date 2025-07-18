% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_su_sui_tlfb.R
\name{compute_su_y_sui__reg_useage}
\alias{compute_su_y_sui__reg_useage}
\title{Compute age of regular use for a given substance}
\usage{
compute_su_y_sui__reg_useage(data, name, substance, combine = TRUE)
}
\arguments{
\item{data}{tibble. A data frame containing the data.}

\item{name}{character. The name of the output column for the computed score.}

\item{substance}{character (vector). The substance to compute the score
for. Must be one of the following values:
\itemize{
\item \code{"alc"}
\item \code{"alc__sip"}
\item \code{"rxstim"}
\item \code{"cath"}
\item \code{"cbd"}
\item \code{"coc"}
\item \code{"dxm"}
\item \code{"ghb"}
\item \code{"hall"}
\item \code{"inh"}
\item \code{"ket"}
\item \code{"meth"}
\item \code{"mdma"}
\item \code{"mj__blunt"}
\item \code{"mj__conc"}
\item \code{"mj__conc__smoke"}
\item \code{"mj__conc__vape"}
\item \code{"mj__drink"}
\item \code{"mj__edbl"}
\item \code{"mj__smoke"}
\item \code{"mj__vape"}
\item \code{"mj__synth"}
\item \code{"mj__tinc"}
\item \code{"nic__chew"}
\item \code{"nic__cigar"}
\item \code{"nic__cig"}
\item \code{"nic__hookah"}
\item \code{"nic__pipe"}
\item \code{"nic__rplc"}
\item \code{"nic__vape"}
\item \code{"opi"}
\item \code{"othdrg"}
\item \code{"qc"}
\item \code{"roid"}
\item \code{"rxopi"}
\item \code{"salv"}
\item \code{"shroom"}
\item \code{"rxsed"}
\item \code{"vape"}
\item \code{"vape__flav"}
}}

\item{combine}{logical. Whether to combine the summary score column with the
input data frame (Default: `TRUE``).}
}
\value{
tbl. The input data frame with the summary score appended as a new
column.
}
\description{
Computes the age (in years) of regular use of a given substance.
Returns \code{NA} for the participants with no regular use of the provided
substance reported.
}
\examples{
\dontrun{
compute_su_y_sui__reg_useage(
  data = data_sui,
  name = "su_y_sui__alc__reg_useage",
  substance = "alc"
)
}

}
