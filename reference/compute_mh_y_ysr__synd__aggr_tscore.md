# Compute "Youth Self Report \[Youth\] (Syndrome Scale - Aggressive): T-score"

Computes the summary score `mh_y_ysr__synd__aggr_tscore` Youth Self
Report \[Youth\] (Syndrome Scale - Aggressive): T-score

- *Summarized variables:*

  - `mh_y_ysr__aggr__opp_001`

  - `mh_y_ysr__aggr__cond_001`

  - `mh_y_ysr__aggr_001`

  - `mh_y_ysr__aggr_002`

  - `mh_y_ysr__aggr__cond_002`

  - `mh_y_ysr__aggr__opp_002`

  - `mh_y_ysr__aggr__opp_003`

  - `mh_y_ysr__aggr__cond_003`

  - `mh_y_ysr__aggr__cond_004`

  - `mh_y_ysr__aggr_003`

  - `mh_y_ysr__aggr__opp_004`

  - `mh_y_ysr__aggr_004`

  - `mh_y_ysr__aggr_005`

  - `mh_y_ysr__aggr_006`

  - `mh_y_ysr__aggr__opp_005`

  - `mh_y_ysr__aggr__cond_005`

  - `mh_y_ysr__aggr__adhd_001`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 17 items missing

## Usage

``` r
compute_mh_y_ysr__synd__aggr_tscore(
  data,
  data_norm = NULL,
  name = "mh_y_ysr__synd__aggr_tscore",
  col_age = "mh_y_ysr_age",
  col_sex = "ab_g_stc__cohort_sex",
  max_na = 1,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- data_norm:

  tbl. Data frame containing the norm (T-score) values. see
  [`ss_tscore()`](https://software.nbdc-datahub.org/ABCDscores/reference/ss_tscore.md).

- name:

  character. Name of the summary score column.

- col_age:

  character, name of the age column. see
  [`ss_tscore()`](https://software.nbdc-datahub.org/ABCDscores/reference/ss_tscore.md).

- col_sex:

  character, name of the sex column. see
  [`ss_tscore()`](https://software.nbdc-datahub.org/ABCDscores/reference/ss_tscore.md).

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

[`compute_mh_y_ysr__synd__aggr_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__synd__aggr_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__synd__aggr_tscore(data) |>
  select(
    any_of(c("mh_y_ysr__synd__aggr_tscore", vars_mh_y_ysr__synd__aggr))
  )
} # }
```
