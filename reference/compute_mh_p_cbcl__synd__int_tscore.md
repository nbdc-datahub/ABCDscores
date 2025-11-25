# Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Internalizing): T-score"

Computes the summary score `mh_p_cbcl__synd__int_tscore` Child Behavior
Checklist \[Parent\] (Syndrome Scale - Internalizing): T-score

- *Summarized variables:*

  - `mh_p_cbcl__anxdep__anx_007`

  - `mh_p_cbcl__anxdep__dep_001`

  - `mh_p_cbcl__anxdep__anx_001`

  - `mh_p_cbcl__anxdep__anx_002`

  - `mh_p_cbcl__anxdep__anx_003`

  - `mh_p_cbcl__anxdep_001`

  - `mh_p_cbcl__anxdep_002`

  - `mh_p_cbcl__anxdep__dep_002`

  - `mh_p_cbcl__anxdep__anx_004`

  - `mh_p_cbcl__anxdep__anx_005`

  - `mh_p_cbcl__anxdep__dep_003`

  - `mh_p_cbcl__anxdep__anx_006`

  - `mh_p_cbcl__anxdep__dep_004`

  - `mh_p_cbcl__wthdep__dep_001`

  - `mh_p_cbcl__wthdep__dep_002`

  - `mh_p_cbcl__wthdep__dep_003`

  - `mh_p_cbcl__wthdep_005`

  - `mh_p_cbcl__wthdep_001`

  - `mh_p_cbcl__wthdep_002`

  - `mh_p_cbcl__wthdep_003`

  - `mh_p_cbcl__wthdep_004`

  - `mh_p_cbcl__som__anx_001`

  - `mh_p_cbcl__som_001`

  - `mh_p_cbcl__som_002`

  - `mh_p_cbcl__som__dep_001`

  - `mh_p_cbcl__som__somat_001`

  - `mh_p_cbcl__som__somat_002`

  - `mh_p_cbcl__som__somat_003`

  - `mh_p_cbcl__som__somat_004`

  - `mh_p_cbcl__som__somat_005`

  - `mh_p_cbcl__som__somat_006`

  - `mh_p_cbcl__som__somat_007`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 2 of 32 items missing

## Usage

``` r
compute_mh_p_cbcl__synd__int_tscore(
  data,
  data_norm = NULL,
  name = "mh_p_cbcl__synd__int_tscore",
  col_age = "mh_p_cbcl_age",
  col_sex = "ab_g_stc__cohort_sex",
  max_na = 2,
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

[`compute_mh_p_cbcl__synd__int_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_cbcl__synd__int_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_cbcl__synd__int_tscore(data) |>
  select(
    any_of(c("mh_p_cbcl__synd__int_tscore", vars_mh_p_cbcl__synd__int))
  )
} # }
```
