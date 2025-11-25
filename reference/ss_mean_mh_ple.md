# Compute mean for MH-PLE scores

Calculates mean scores for variables with forking logic, where variables
may only be applicable based on certain conditions. Missing values and
exclusions are handled based on the forking variable values.

## Usage

``` r
ss_mean_mh_ple(
  data,
  name,
  fork_vars,
  fork_val = "1",
  vars,
  max_na = NULL,
  exclude = NULL,
  events = NULL,
  combine = TRUE,
  no_na = FALSE
)
```

## Arguments

- data:

  Data frame containing columns to summarize

- name:

  String specifying name for summary score column

- fork_vars:

  Character vector of columns used as logical conditions

- fork_val:

  String indicating value in fork_vars for valid responses

- vars:

  Character vector of columns to summarize

- max_na:

  Integer for maximum allowed missing values

- exclude:

  Character vector of values to exclude

- events:

  Character vector of events to compute scores for

- combine:

  Logical; if TRUE, append score to input data

- no_na:

  Logical; if TRUE, return NA when any value is missing

## Value

Data frame with summary score column

## Examples

``` r
data <- tibble::tribble(
  ~session_id, ~a, ~b, ~c, ~a__severe, ~b__severe, ~c__severe,
  "ses-00A", "1", "1", "1", "1", NA, NA,
  "ses-01A", "1", "1", "1", "2", "777", "2"
)

data |>
  ss_mean_mh_ple(
    name = "mean",
    fork_vars = c("a", "b", "c"),
    vars = paste0(c("a", "b", "c"), "__severe"),
    max_na = 1,
    exclude = c("777", "999")
  )
#> # A tibble: 2 × 8
#>   session_id a     b     c     a__severe b__severe c__severe  mean
#>   <chr>      <chr> <chr> <chr> <chr>     <chr>     <chr>     <dbl>
#> 1 ses-00A    1     1     1     1         NA        NA           NA
#> 2 ses-01A    1     1     1     2         777       2             2
```
