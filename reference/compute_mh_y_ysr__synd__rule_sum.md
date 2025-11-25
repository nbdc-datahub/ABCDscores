# Compute "Youth Self Report \[Youth\] (Syndrome Scale - Rule breaking behavior): Sum"

Computes the summary score `mh_y_ysr__synd__rule_sum` Youth Self Report
\[Youth\] (Syndrome Scale - Rule breaking behavior): Sum

- *Summarized variables:*

  - `mh_y_ysr__rule_001`

  - `mh_y_ysr__rule__cond_001`

  - `mh_y_ysr__rule__cond_002`

  - `mh_y_ysr__rule__cond_003`

  - `mh_y_ysr__rule__cond_004`

  - `mh_y_ysr__rule_002`

  - `mh_y_ysr__rule__cond_005`

  - `mh_y_ysr__rule__cond_006`

  - `mh_y_ysr__rule__cond_007`

  - `mh_y_ysr__rule__cond_008`

  - `mh_y_ysr__rule__cond_009`

  - `mh_y_ysr__rule_003`

  - `mh_y_ysr__rule_004`

  - `mh_y_ysr__rule__cond_010`

  - `mh_y_ysr__rule_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 15 items missing

## Usage

``` r
compute_mh_y_ysr__synd__rule_sum(
  data,
  name = "mh_y_ysr__synd__rule_sum",
  max_na = 1,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- exclude:

  character vector. Values to be excluded from the summary score.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_ysr__synd__rule_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__synd__rule_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__synd__rule_sum(data) |>
  select(
    any_of(c("mh_y_ysr__synd__rule_sum", vars_mh_y_ysr__synd__rule))
  )
} # }
```
