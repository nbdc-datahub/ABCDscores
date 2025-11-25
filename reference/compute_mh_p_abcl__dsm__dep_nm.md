# Compute "Adult Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive problems): Number missing"

Computes the summary score `mh_p_abcl__dsm__dep_nm` Adult Behavior
Checklist \[Parent\] (DSM-5 Oriented Scale - Depressive problems):
Number missing

- *Summarized variables:*

  - `mh_p_abcl__anxdep__dep_001`

  - `mh_p_abcl__anxdep__dep_002`

  - `mh_p_abcl__anxdep__dep_003`

  - `mh_p_abcl__anxdep__dep_004`

  - `mh_p_abcl__anxdep__dep_005`

  - `mh_p_abcl__attn__dep_001`

  - `mh_p_abcl__attn__dep_002`

  - `mh_p_abcl__attn__dep_003`

  - `mh_p_abcl__othpr__dep_001`

  - `mh_p_abcl__othpr__dep_002`

  - `mh_p_abcl__othpr__dep_003`

  - `mh_p_abcl__som__dep_001`

  - `mh_p_abcl__tho__dep_001`

  - `mh_p_abcl__tho__dep_002`

  - `mh_p_abcl__wthdr__dep_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_abcl__dsm__dep

compute_mh_p_abcl__dsm__dep_nm(
  data,
  name = "mh_p_abcl__dsm__dep_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_abcl__dsm__dep` is vector of all column names used to compute
summary score of `mh_p_abcl__dsm__dep` scores.

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
compute_mh_p_abcl__dsm__dep_nm(data) |>
  select(
    any_of(c("mh_p_abcl__dsm__dep_nm", vars_mh_p_abcl__dsm__dep))
  )
} # }
```
