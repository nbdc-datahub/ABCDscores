# Count missing values for MH-PLE scores

Counts missing values for variables with forking logic, where variables
may only be applicable based on certain conditions. Excluded values are
treated as missing.

## Usage

``` r
ss_nm_mh_ple(
  data,
  name,
  fork_vars,
  fork_val = "1",
  vars,
  exclude = NULL,
  events = NULL,
  combine = TRUE
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

- exclude:

  Character vector of values to exclude

- events:

  Character vector of events to compute scores for

- combine:

  Logical; if TRUE, append score to input data

## Value

Data frame with count of missing values

## Examples

``` r
data <- tibble::tribble(
  ~session_id, ~a, ~b, ~c, ~a__severe, ~b__severe, ~c__severe,
  "ses-00A", "1", "1", "1", "1", NA, NA,
  "ses-01A", "1", "1", "1", "2", "777", "2"
)

data |>
  ss_nm_mh_ple(
    name = "nm",
    fork_vars = c("a", "b", "c"),
    vars = paste0(c("a", "b", "c"), "__severe"),
    exclude = c("777", "999")
  )
#> # A tibble: 2 × 8
#>   session_id a     b     c     a__severe b__severe c__severe    nm
#>   <chr>      <chr> <chr> <chr> <chr>     <chr>     <chr>     <int>
#> 1 ses-00A    1     1     1     1         NA        NA            2
#> 2 ses-01A    1     1     1     2         777       2             1
```
