# Compute max across columns

Computes the max of a set of variables, with the option to exclude
certain values (for non-responses like "Don't know"/"Decline to answer")
and to set a maximum number of missing values.

## Usage

``` r
ss_max(
  data,
  name,
  vars,
  max_na = NULL,
  exclude = NULL,
  events = NULL,
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

- combine:

  logical. Whether to combine the summary score column with the input
  data frame (Default: TRUE).

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
data <- tibble::tribble(
  ~id,    ~session_id, ~A, ~B,  ~C, ~D,
  "id1",  "1",         1,  5,   2,  NA,
  "id1",  "2",         2,  4,   NA, NA,
  "id1",  "3",         3,  3,   3,  3,
  "id1",  "4",         4,  2,   4,  2,
  "id1",  "5",         5,  1,   5,  3
)

ss_max(
  data,
  name = "summary",
  vars = c("A", "B", "C", "D")
)
#> Warning: There was 1 warning in `mutate()`.
#> ℹ In argument: `summary = if_else(...)`.
#> Caused by warning:
#> ! `invoke()` was deprecated in purrr 1.0.0.
#> ℹ Please use `exec()` instead.
#> ℹ The deprecated feature was likely used in the ABCDscores package.
#>   Please report the issue to the authors.
#> # A tibble: 5 × 7
#>   id    session_id     A     B     C     D summary
#>   <chr> <chr>      <dbl> <dbl> <dbl> <dbl>   <dbl>
#> 1 id1   1              1     5     2    NA       5
#> 2 id1   2              2     4    NA    NA       4
#> 3 id1   3              3     3     3     3       3
#> 4 id1   4              4     2     4     2       4
#> 5 id1   5              5     1     5     3       5

ss_max(
  data,
  name = "summary",
  vars = c("A", "B", "C", "D"),
  max_na = 1,
  exclude = c("1")
)
#> # A tibble: 5 × 7
#>   id    session_id     A     B     C     D summary
#>   <chr> <chr>      <dbl> <dbl> <dbl> <dbl>   <dbl>
#> 1 id1   1              1     5     2    NA      NA
#> 2 id1   2              2     4    NA    NA      NA
#> 3 id1   3              3     3     3     3       3
#> 4 id1   4              4     2     4     2       4
#> 5 id1   5              5     1     5     3       5

ss_max(
  data,
  name = "summary",
  vars = c("A", "B", "C", "D"),
  max_na = 1,
  exclude = c("1"),
  events = c("4")
)
#> # A tibble: 5 × 7
#>   id    session_id     A     B     C     D summary
#>   <chr> <chr>      <dbl> <dbl> <dbl> <dbl>   <dbl>
#> 1 id1   1              1     5     2    NA      NA
#> 2 id1   2              2     4    NA    NA      NA
#> 3 id1   3              3     3     3     3      NA
#> 4 id1   4              4     2     4     2       4
#> 5 id1   5              5     1     5     3      NA
```
