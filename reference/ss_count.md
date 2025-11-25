# Compute the number or count of matching conditions

Computes the number of conditions (provided as a character
vector`cond`), involving the input variables `vars`, that were found to
be `TRUE`. Options available to exclude certain values from the input
variables (provided as a character vector `exclude`).

## Usage

``` r
ss_count(
  data,
  name,
  vars,
  vars_temp = NULL,
  exclude = NULL,
  combine = FALSE,
  allow_missingness = TRUE,
  cond
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. The name of the summary score.

- vars:

  character vector. The name(s) of the column(s) to be summarized.

- vars_temp:

  character vector. The name(s) of temporary column(s) used to compute
  the summary score. Note, these columns are not checked for
  missingness. See `allow_missingness`.

- exclude:

  character (vector). The value(s) to be excluded (Default: NULL; all
  values are used).

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: FALSE).

- allow_missingness:

  logical. Default set to TRUE. If TRUE, summary score is set to `NA`
  only when ALL the in-going fields have missingness. If FALSE, summary
  score is set to `NA` when ANY of the in-going fields have missingness.
  NOTE: `exclude` operation is performed prior to checking for
  missingness.

- cond:

  character vector. Each specified condition, involving the values of
  specific input fields, gets tested for `1` (`TRUE`) or `0` (`FALSE`).
  If a condition is specified as `"field_name"`, the numeric value in
  the field is counted and could be greater than 1. Whereas other
  conditions when met can get a value of `1` or `0`. The summary score
  is a sum over all the values obtained from testing each condition
  specified in `cond`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
dat <- tibble::tibble(
  id   = c("1", "2", "3", "4", "5", "6", "7", "8"),
  a_1  = c(1, 1, NA, 1, 1, 1, 1, 1),
  a_2  = c(1, NA, NA, 1, 1, NA, 1, 1),
  b_1  = c(1, 1, NA, NA, 1, 1, 1, 1),
  b_2  = c(1, 1, NA, 1, 1, NA, 1, 1),
  c    = c(NA, 1, NA, 1, 777, 0, 1, 0)
)

# define conditions to assess
conditions <- c(
  "a_1 == 1 & a_2 == 1",
  "b_1 == 1 & b_2 == 1",
  "c"
)

# count number of matched conditions
ss_count(
  data    = dat,
  name    = "ss",
  vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
  cond    = conditions,
  combine = TRUE
)
#> # A tibble: 8 × 7
#>   id      a_1   a_2   b_1   b_2     c    ss
#>   <chr> <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 1         1     1     1     1    NA     2
#> 2 2         1    NA     1     1     1     2
#> 3 3        NA    NA    NA    NA    NA    NA
#> 4 4         1     1    NA     1     1     2
#> 5 5         1     1     1     1   777   779
#> 6 6         1    NA     1    NA     0     0
#> 7 7         1     1     1     1     1     3
#> 8 8         1     1     1     1     0     2

ss_count(
  data    = dat,
  name    = "ss",
  vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
  cond    = conditions,
  exclude = c("777"),
  combine = TRUE
)
#> # A tibble: 8 × 7
#>   id      a_1   a_2   b_1   b_2     c    ss
#>   <chr> <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 1         1     1     1     1    NA     2
#> 2 2         1    NA     1     1     1     2
#> 3 3        NA    NA    NA    NA    NA    NA
#> 4 4         1     1    NA     1     1     2
#> 5 5         1     1     1     1   777     2
#> 6 6         1    NA     1    NA     0     0
#> 7 7         1     1     1     1     1     3
#> 8 8         1     1     1     1     0     2

conditions <- paste(
  c(
    "a_1 == 1 & a_2 == 1",
    "b_1 == 1 & b_2 == 1",
    "c >= 1"
  ),
  collapse = "&"
)

ss_count(
  data    = dat,
  name    = "ss",
  vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
  cond    = conditions,
  exclude = c("777"),
  combine = TRUE
)
#> # A tibble: 8 × 7
#>   id      a_1   a_2   b_1   b_2     c    ss
#>   <chr> <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 1         1     1     1     1    NA     0
#> 2 2         1    NA     1     1     1     0
#> 3 3        NA    NA    NA    NA    NA    NA
#> 4 4         1     1    NA     1     1     0
#> 5 5         1     1     1     1   777     0
#> 6 6         1    NA     1    NA     0     0
#> 7 7         1     1     1     1     1     1
#> 8 8         1     1     1     1     0     0

ss_count(
  data = dat,
  name = "ss",
  vars = c("a_1", "a_2", "b_1", "b_2", "c"),
  cond = conditions,
  exclude = c("777"),
  allow_missingness = FALSE,
  combine = TRUE
)
#> # A tibble: 8 × 7
#>   id      a_1   a_2   b_1   b_2     c    ss
#>   <chr> <dbl> <dbl> <dbl> <dbl> <dbl> <int>
#> 1 1         1     1     1     1    NA    NA
#> 2 2         1    NA     1     1     1    NA
#> 3 3        NA    NA    NA    NA    NA    NA
#> 4 4         1     1    NA     1     1    NA
#> 5 5         1     1     1     1   777    NA
#> 6 6         1    NA     1    NA     0    NA
#> 7 7         1     1     1     1     1     1
#> 8 8         1     1     1     1     0     0
```
