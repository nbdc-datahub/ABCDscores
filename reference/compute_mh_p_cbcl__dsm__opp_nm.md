# Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Oppositional Defiant problems): Number missing"

Computes the summary score `mh_p_cbcl__dsm__opp_nm` Child Behavior
Checklist \[Parent\] (DSM-5 Oriented Scale - Oppositional Defiant
problems): Number missing

- *Summarized variables:*

  - `mh_p_cbcl__aggr__opp_001`

  - `mh_p_cbcl__aggr__opp_002`

  - `mh_p_cbcl__aggr__opp_003`

  - `mh_p_cbcl__aggr__opp_004`

  - `mh_p_cbcl__aggr__opp_005`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_cbcl__dsm__opp

compute_mh_p_cbcl__dsm__opp_nm(
  data,
  name = "mh_p_cbcl__dsm__opp_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_cbcl__dsm__opp` is vector of all column names used to compute
summary score of `mh_p_cbcl__dsm__opp` scores.

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
compute_mh_p_cbcl__dsm__opp_nm(data) |>
  select(
    any_of(c("mh_p_cbcl__dsm__opp_nm", vars_mh_p_cbcl__dsm__opp))
  )
} # }
```
