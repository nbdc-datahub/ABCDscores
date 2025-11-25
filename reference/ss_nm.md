# Compute number missing

Computes the number of missing items among a set of variables, with the
option to exclude certain values (for non-responses like "Don't know" /
"Decline to answer"). If all items are NA, the summary score will not be
computed (assuming that the questionnaire was not filled out at all).

## Usage

``` r
ss_nm(data, name, vars, exclude = NULL, events = NULL, combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. The name of the summary score.

- vars:

  character vector. The names of the columns to be summarized.

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- events:

  character (vector). Only compute the summary score for the specified
  events (Default: NULL; computed for all events).

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: TRUE).

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
data <- tibble::tribble(
  ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
  "ses-00A",   1,  1,   1,   1,   NA,
  "ses-01A",   2,  777, 2,   2,   2,
  "ses-02A",   3,  3,   999, 3,   3,
  "ses-02A",   4,  4,   4,   777, NA,
  "ses-03A",   5,  NA,  777, 999, 5,
  "ses-03A",   NA, NA,  NA,  NA,  NA,
  "ses-04A",   1,  NA,  NA,  NA,  NA
)

data |>
  ss_nm(
    name    = "nm",
    vars    = c("a", "b", "c", "d", "e"),
    exclude = c("777", "999")
  )
#> # A tibble: 7 × 7
#>   session_id     a     b     c     d     e    nm
#>   <chr>      <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 ses-00A        1     1     1     1    NA     1
#> 2 ses-01A        2   777     2     2     2     1
#> 3 ses-02A        3     3   999     3     3     1
#> 4 ses-02A        4     4     4   777    NA     2
#> 5 ses-03A        5    NA   777   999     5     3
#> 6 ses-03A       NA    NA    NA    NA    NA     5
#> 7 ses-04A        1    NA    NA    NA    NA     4

data |>
  ss_nm(
    name    = "nm",
    vars    = c("a", "b", "c", "d", "e"),
    exclude = c("777", "999"),
    event   = c("ses-00A", "ses-01A")
  )
#> # A tibble: 7 × 7
#>   session_id     a     b     c     d     e    nm
#>   <chr>      <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 ses-00A        1     1     1     1    NA     1
#> 2 ses-01A        2   777     2     2     2     1
#> 3 ses-02A        3     3   999     3     3    NA
#> 4 ses-02A        4     4     4   777    NA    NA
#> 5 ses-03A        5    NA   777   999     5    NA
#> 6 ses-03A       NA    NA    NA    NA    NA    NA
#> 7 ses-04A        1    NA    NA    NA    NA    NA
```
