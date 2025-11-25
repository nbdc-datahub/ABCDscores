# Compute "Youth Self Report \[Youth\] (DSM-5 Oriented Scale - Oppositional Defiant problems): Sum"

Computes the summary score `mh_y_ysr__dsm__opp_sum` Youth Self Report
\[Youth\] (DSM-5 Oriented Scale - Oppositional Defiant problems): Sum

- *Summarized variables:*

  - `mh_y_ysr__aggr__opp_001`

  - `mh_y_ysr__aggr__opp_002`

  - `mh_y_ysr__aggr__opp_003`

  - `mh_y_ysr__aggr__opp_004`

  - `mh_y_ysr__aggr__opp_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 5 items missing

## Usage

``` r
compute_mh_y_ysr__dsm__opp_sum(
  data,
  name = "mh_y_ysr__dsm__opp_sum",
  max_na = 0,
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

[`compute_mh_y_ysr__dsm__opp_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__dsm__opp_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__dsm__opp_sum(data) |>
  select(
    any_of(c("mh_y_ysr__dsm__opp_sum", vars_mh_y_ysr__dsm__opp))
  )
} # }
```
