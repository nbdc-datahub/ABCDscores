# Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive behavior): Sum"

Computes the summary score `mh_p_cbcl__synd__aggr_sum` Child Behavior
Checklist \[Parent\] (Syndrome Scale - Aggressive behavior): Sum

- *Summarized variables:*

  - `mh_p_cbcl__aggr__opp_001`

  - `mh_p_cbcl__aggr__adhd_001`

  - `mh_p_cbcl__aggr__cond_001`

  - `mh_p_cbcl__aggr_001`

  - `mh_p_cbcl__aggr_002`

  - `mh_p_cbcl__aggr__cond_002`

  - `mh_p_cbcl__aggr__opp_002`

  - `mh_p_cbcl__aggr__opp_003`

  - `mh_p_cbcl__aggr__cond_003`

  - `mh_p_cbcl__aggr__cond_004`

  - `mh_p_cbcl__aggr_003`

  - `mh_p_cbcl__aggr__opp_004`

  - `mh_p_cbcl__aggr_004`

  - `mh_p_cbcl__aggr_005`

  - `mh_p_cbcl__aggr_006`

  - `mh_p_cbcl__aggr_007`

  - `mh_p_cbcl__aggr__opp_005`

  - `mh_p_cbcl__aggr__cond_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 18 items missing

## Usage

``` r
compute_mh_p_cbcl__synd__aggr_sum(
  data,
  name = "mh_p_cbcl__synd__aggr_sum",
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

[`compute_mh_p_cbcl__synd__aggr_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_cbcl__synd__aggr_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_cbcl__synd__aggr_sum(data) |>
  select(
    any_of(c("mh_p_cbcl__synd__aggr_sum", vars_mh_p_cbcl__synd__aggr))
  )
} # }
```
