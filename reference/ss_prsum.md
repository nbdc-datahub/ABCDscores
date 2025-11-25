# Compute pro-rated sum

Computes the pro-rated sum of a set of variables, with the option to
exclude certain values (for non-responses like "Don't know"/"Decline to
answer") and to set a maximum number of missing values. Also include a
second field

## Usage

``` r
ss_prsum(
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
data <- tibble::tibble(
  participant_id = c("A", "A", "A", "B", "A", "B", "A"),
  session_id     = c("ses-00A", "ses-01A", "ses-02A", "ses-02A", "ses-03A", "0ses-3A", "ses-04A"),
  a              = c(1, 2, 3, 4, 5, NA, 1),
  b              = c(1, 777, 3, 4, NA, NA, NA),
  c              = c(1, 2, 999, 4, 777, NA, NA),
  d              = c(1, 2, 3, 777, 999, NA, NA),
  e              = c(NA, 2, 3, NA, 5, NA, NA)
)

data |>
  ss_prsum(
    name = "score_prorated_sum",
    vars = c("a", "b", "c", "d", "e"),
    max_na = 1,
    exclude = c("777", "999")
  )
#> # A tibble: 7 × 8
#>   participant_id session_id     a     b     c     d     e score_prorated_sum
#>   <chr>          <chr>      <dbl> <dbl> <dbl> <dbl> <dbl>              <int>
#> 1 A              ses-00A        1     1     1     1    NA                  5
#> 2 A              ses-01A        2   777     2     2     2                 10
#> 3 A              ses-02A        3     3   999     3     3                 15
#> 4 B              ses-02A        4     4     4   777    NA                 NA
#> 5 A              ses-03A        5    NA   777   999     5                 NA
#> 6 B              0ses-3A       NA    NA    NA    NA    NA                 NA
#> 7 A              ses-04A        1    NA    NA    NA    NA                 NA

data |>
  ss_prsum(
    name = "score_prorated_sum",
    vars = c("a", "b", "c", "d", "e"),
    max_na = 1,
    exclude = c("777", "999"),
    combine = FALSE
  )
#> # A tibble: 7 × 1
#>   score_prorated_sum
#>                <int>
#> 1                  5
#> 2                 10
#> 3                 15
#> 4                 NA
#> 5                 NA
#> 6                 NA
#> 7                 NA

data |>
  ss_prsum(
    name = "score_prorated_sum",
    vars = c("a", "b", "c", "d", "e"),
    max_na = NULL,
    exclude = NULL,
    events = c("ses-00A", "ses-01A"),
  )
#> # A tibble: 7 × 8
#>   participant_id session_id     a     b     c     d     e score_prorated_sum
#>   <chr>          <chr>      <dbl> <dbl> <dbl> <dbl> <dbl>              <int>
#> 1 A              ses-00A        1     1     1     1    NA                  5
#> 2 A              ses-01A        2   777     2     2     2                785
#> 3 A              ses-02A        3     3   999     3     3                 NA
#> 4 B              ses-02A        4     4     4   777    NA                 NA
#> 5 A              ses-03A        5    NA   777   999     5                 NA
#> 6 B              0ses-3A       NA    NA    NA    NA    NA                 NA
#> 7 A              ses-04A        1    NA    NA    NA    NA                 NA
```
