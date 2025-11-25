# Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Attention problems): T-score"

Computes the summary score `mh_p_abcl__synd__attn_tscore` Adult Behavior
Checklist \[Parent\] (Syndrome Scale - Attention problems): T-score

- *Summarized variables:*

  - `mh_p_abcl__attn_001`

  - `mh_p_abcl__attn_002`

  - `mh_p_abcl__attn_003`

  - `mh_p_abcl__attn_004`

  - `mh_p_abcl__attn_005`

  - `mh_p_abcl__attn_006`

  - `mh_p_abcl__attn__adhd_001`

  - `mh_p_abcl__attn__adhd_002`

  - `mh_p_abcl__attn__adhd_003`

  - `mh_p_abcl__attn__adhd_004`

  - `mh_p_abcl__attn__adhd_005`

  - `mh_p_abcl__attn__adhd_006`

  - `mh_p_abcl__attn__adhd_007`

  - `mh_p_abcl__attn__antsoc_001`

  - `mh_p_abcl__attn__dep_001`

  - `mh_p_abcl__attn__dep_002`

  - `mh_p_abcl__attn__dep_003`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 17 items missing

## Usage

``` r
compute_mh_p_abcl__synd__attn_tscore(
  data,
  data_norm = NULL,
  name = "mh_p_abcl__synd__attn_tscore",
  col_age = "mh_p_abcl__cg2__age_001",
  col_sex = "mh_p_abcl__cg2_sex",
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

[`compute_mh_p_abcl__synd__attn_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_abcl__synd__attn_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__synd__attn_tscore(data) |>
  select(
    any_of(c("mh_p_abcl__synd__attn_tscore", vars_mh_p_abcl__synd__attn))
  )
} # }
```
