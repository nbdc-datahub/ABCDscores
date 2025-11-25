# Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Conduct problems): Number missing"

Computes the summary score `mh_y_ysr__dsm__cond_nm` Youth Self Report
\[Youth\] (DSM-5 Oriented Scale - Conduct problems): Number missing

- *Summarized variables:*

  - `mh_y_ysr__aggr__cond_001`

  - `mh_y_ysr__aggr__cond_002`

  - `mh_y_ysr__rule__cond_001`

  - `mh_y_ysr__rule__cond_002`

  - `mh_y_ysr__aggr__cond_003`

  - `mh_y_ysr__rule__cond_003`

  - `mh_y_ysr__rule__cond_004`

  - `mh_y_ysr__aggr__cond_004`

  - `mh_y_ysr__rule__cond_005`

  - `mh_y_ysr__rule__cond_006`

  - `mh_y_ysr__rule__cond_007`

  - `mh_y_ysr__rule__cond_008`

  - `mh_y_ysr__rule__cond_009`

  - `mh_y_ysr__aggr__cond_005`

  - `mh_y_ysr__rule__cond_010`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_y_ysr__dsm__cond

compute_mh_y_ysr__dsm__cond_nm(
  data,
  name = "mh_y_ysr__dsm__cond_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_y_ysr__dsm__cond` is vector of all column names used to compute
summary score of `mh_y_ysr__dsm__cond` scores.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__dsm__cond_nm(data) |>
  select(
    any_of(c("mh_y_ysr__dsm__cond_nm", vars_mh_y_ysr__dsm__cond))
  )
} # }
```
