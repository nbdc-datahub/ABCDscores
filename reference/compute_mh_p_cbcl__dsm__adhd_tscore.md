# Compute "Child Behavior Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): T-score"

Computes the summary score `mh_p_cbcl__dsm__adhd_tscore` Child Behavior
Checklist \[Parent\] (DSM-5 Oriented Scale - ADHD): T-score

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

- *Validation criterion:* maximally 0 of 7 items missing

## Usage

``` r
compute_mh_p_cbcl__dsm__adhd_tscore(
  data,
  data_norm = NULL,
  name = "mh_p_cbcl__dsm__adhd_tscore",
  col_age = "mh_p_cbcl_age",
  col_sex = "ab_g_stc__cohort_sex",
  max_na = 0,
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

[`compute_mh_p_cbcl__dsm__adhd_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_cbcl__dsm__adhd_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_cbcl__dsm__adhd_tscore(data) |>
  select(
    any_of(c("mh_p_cbcl__dsm__adhd_tscore", vars_mh_p_cbcl__dsm__adhd))
  )
} # }
```
