% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scores_ph.R
\name{convert_time_mctq}
\alias{convert_time_mctq}
\title{Convert MCTQ time data to 24h or 36 format}
\usage{
convert_time_mctq(data, name, col_hrs_a, col_hrs_b, col_minute, scale = "24h")
}
\arguments{
\item{data}{tbl. Data frame containing the columns to be summarized.}

\item{name}{character. The name of the new column with the summary score.}

\item{col_hrs_a}{character. The name of the column with the first time.

1, 4 AM | 2, 5 AM | 3, 6 AM | 4, 7 AM | 5, 8 AM | 6, 9 AM | 7, 10 AM |
8, 11 AM | 9, 12 PM | 10, 1 PM | 11, 2 PM | 12, 3 PM | 13, 4 PM}

\item{col_hrs_b}{character. The name of the column with the second time.

1, 5 PM | 2, 6 PM | 3, 7 PM | 4, 8 PM | 5, 9 PM | 6, 10 PM | 7, 11 PM |
8, 12 AM | 9, 1 AM | 10, 2 AM | 11, 3 AM}

\item{col_minute}{character. The name of the column with the minutes. If the
column value is \code{NA}, the minute is set to 0.

1, 0 minutes | 2, 5 minutes | 3, 10 minutes |
4, 15 minutes | 5, 20 minutes | 6, 25 minutes |
7, 30 minutes | 8, 35 minutes | 9, 40 minutes |
10, 45 minutes | 11, 50 minutes | 12, 55 minutes}

\item{scale}{character. The scale of the time format. Default is "24h".
The other option is "36h".}
}
\value{
tbl. The input data frame with the summary score appended as a new
column.
}
\description{
Utility function to convert MCTQ survey responses to 24h or 36h format times.
}
\details{
Expect values 0 <= value < 24 for 24h format.
Expect values 12 <= value < 36 for 36h format.
}
\examples{
col_hrs_a <- "ph_y_mctq__fd_001__01a"
col_hrs_b <- "ph_y_mctq__fd_001__01b"
col_minute <- "ph_y_mctq__fd_001__02"
name <- "ph_y_mctq__fd__bed__start__24h_t"
data <- dplyr::tibble(
  ph_y_mctq__fd_001__01a = c(NA, NA, NA, NA, NA, 1, 7, 3, NA),
  ph_y_mctq__fd_001__01b = c(6, 7, 8, 8, 10, NA, NA, NA, NA),
  ph_y_mctq__fd_001__02 = c(1, 1, 1, 7, 7, 1, 4, 1, NA)
)
convert_time_mctq(data, name, col_hrs_a, col_hrs_b, col_minute)
name <- "ph_y_mctq__fd__bed__start__36h_t"
convert_time_mctq(data, name, col_hrs_a, col_hrs_b, col_minute, "36h")
}
