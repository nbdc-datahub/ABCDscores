# Compute "Child Behavior Checklist \[Parent\] (Stress): Number missing"

Computes the summary score `mh_p_cbcl__strs_nm` Child Behavior Checklist
\[Parent\] (Stress): Number missing

- *Summarized variables:*

  - `mh_p_cbcl__aggr__opp_001`

  - `mh_p_cbcl__attn__adhd_002`

  - `mh_p_cbcl__tho_001`

  - `mh_p_cbcl__wthdep__dep_002`

  - `mh_p_cbcl__soc__anx_001`

  - `mh_p_cbcl__wthdep_005`

  - `mh_p_cbcl__anxdep__anx_003`

  - `mh_p_cbcl__soc_004`

  - `mh_p_cbcl__anxdep__anx_004`

  - `mh_p_cbcl__som__anx_001`

  - `mh_p_cbcl__anxdep__anx_005`

  - `mh_p_cbcl__anxdep__dep_003`

  - `mh_p_cbcl__wthdep_003`

  - `mh_p_cbcl__aggr_004`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_cbcl__strs

compute_mh_p_cbcl__strs_nm(
  data,
  name = "mh_p_cbcl__strs_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_cbcl__strs` is vector of all column names used to compute
summary score of `mh_p_cbcl__strs` scores.

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
compute_mh_p_cbcl__strs_nm(data) |>
  select(
    any_of(c("mh_p_cbcl__strs_nm", vars_mh_p_cbcl__strs))
  )
} # }
```
