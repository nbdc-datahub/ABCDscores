# Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Rule breaking behavior): Number missing"

Computes the summary score `mh_p_cbcl__synd__rule_nm` Child Behavior
Checklist \[Parent\] (Syndrome Scale - Rule breaking behavior): Number
missing

- *Summarized variables:*

  - `mh_p_cbcl__rule_001`

  - `mh_p_cbcl__rule__cond_010`

  - `mh_p_cbcl__rule_006`

  - `mh_p_cbcl__rule__cond_011`

  - `mh_p_cbcl__rule__cond_001`

  - `mh_p_cbcl__rule__cond_002`

  - `mh_p_cbcl__rule__cond_003`

  - `mh_p_cbcl__rule__cond_004`

  - `mh_p_cbcl__rule_002`

  - `mh_p_cbcl__rule__cond_005`

  - `mh_p_cbcl__rule__cond_006`

  - `mh_p_cbcl__rule_003`

  - `mh_p_cbcl__rule__cond_007`

  - `mh_p_cbcl__rule__cond_008`

  - `mh_p_cbcl__rule__cond_009`

  - `mh_p_cbcl__rule_004`

  - `mh_p_cbcl__rule_005`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_cbcl__synd__rule

compute_mh_p_cbcl__synd__rule_nm(
  data,
  name = "mh_p_cbcl__synd__rule_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_cbcl__synd__rule` is vector of all column names used to
compute summary score of `mh_p_cbcl__synd__rule` scores.

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
compute_mh_p_cbcl__synd__rule_nm(data) |>
  select(
    any_of(c("mh_p_cbcl__synd__rule_nm", vars_mh_p_cbcl__synd__rule))
  )
} # }
```
