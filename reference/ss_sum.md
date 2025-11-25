# Compute sum

Computes the sum of a set of variables, with the option to exclude
certain values (for non-responses like "Don't know"/"Decline to answer")
and to set a maximum number of missing values.

## Usage

``` r
ss_sum(
  data,
  name,
  vars,
  max_na = NULL,
  exclude = NULL,
  events = NULL,
  as_integer = TRUE,
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. The name of the summary score.

- vars:

  character vector. The names of the columns to be summarized.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: NULL; no restriction on missing values).

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- events:

  character (vector). Only compute the summary score for the specified
  events (Default: NULL; computed for all events).

- as_integer:

  logical. Whether to coerce the summary score to an integer, default is
  `TRUE`. If `FALSE`, the summary score will be a double.

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
  ss_sum(
    name = "mean",
    vars = c("a", "b", "c", "d", "e"),
    max_na = 1,
    exclude = c("777", "999")
  )
#> # A tibble: 7 × 7
#>   session_id     a     b     c     d     e  mean
#>   <chr>      <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 ses-00A        1     1     1     1    NA     4
#> 2 ses-01A        2   777     2     2     2     8
#> 3 ses-02A        3     3   999     3     3    12
#> 4 ses-02A        4     4     4   777    NA    NA
#> 5 ses-03A        5    NA   777   999     5    NA
#> 6 ses-03A       NA    NA    NA    NA    NA    NA
#> 7 ses-04A        1    NA    NA    NA    NA    NA

data |>
  ss_sum(
    name = "mean",
    vars = c("a", "b", "c", "d", "e"),
    max_na = 1,
    exclude = c("777", "999"),
    combine = FALSE
  )
#> # A tibble: 7 × 1
#>    mean
#>   <int>
#> 1     4
#> 2     8
#> 3    12
#> 4    NA
#> 5    NA
#> 6    NA
#> 7    NA

data |>
  ss_sum(
    name = "mean",
    vars = c("a", "b", "c", "d", "e"),
    max_na = NULL,
    exclude = NULL,
    events = c("ses-00A", "ses-01A"),
  )
#> # A tibble: 7 × 7
#>   session_id     a     b     c     d     e  mean
#>   <chr>      <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 ses-00A        1     1     1     1    NA     4
#> 2 ses-01A        2   777     2     2     2   785
#> 3 ses-02A        3     3   999     3     3    NA
#> 4 ses-02A        4     4     4   777    NA    NA
#> 5 ses-03A        5    NA   777   999     5    NA
#> 6 ses-03A       NA    NA    NA    NA    NA    NA
#> 7 ses-04A        1    NA    NA    NA    NA    NA
```
