# Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): Number missing"

Computes the summary score `mh_p_cbcl__dsm__adhd_nm` Child Behavior
Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): Number missing

- *Summarized variables:*

  - `mh_p_cbcl__attn__adhd_001`

  - `mh_p_cbcl__attn__adhd_002`

  - `mh_p_cbcl__attn__adhd_003`

  - `mh_p_cbcl__aggr__adhd_001`

  - `mh_p_cbcl__attn__adhd_004`

  - `mh_p_cbcl__attn__adhd_005`

  - `mh_p_cbcl__othpr__adhd_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_cbcl__dsm__adhd

compute_mh_p_cbcl__dsm__adhd_nm(
  data,
  name = "mh_p_cbcl__dsm__adhd_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_cbcl__dsm__adhd` is vector of all column names used to
compute summary score of `mh_p_cbcl__dsm__adhd` scores.

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
compute_mh_p_cbcl__dsm__adhd_nm(data) |>
  select(
    any_of(c("mh_p_cbcl__dsm__adhd_nm", vars_mh_p_cbcl__dsm__adhd))
  )
} # }
```
