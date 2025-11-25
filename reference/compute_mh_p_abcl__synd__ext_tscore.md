# Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - External): T-score"

Computes the summary score `mh_p_abcl__synd__ext_tscore` Adult Behavior
Checklist \[Parent\] (Syndrome Scale - External): T-score

- *Summarized variables:*

  - `mh_p_abcl__aggr_001`

  - `mh_p_abcl__aggr_002`

  - `mh_p_abcl__aggr_003`

  - `mh_p_abcl__aggr_004`

  - `mh_p_abcl__aggr_005`

  - `mh_p_abcl__aggr_006`

  - `mh_p_abcl__aggr_007`

  - `mh_p_abcl__aggr__adhd_001`

  - `mh_p_abcl__aggr__antsoc_001`

  - `mh_p_abcl__aggr__antsoc_002`

  - `mh_p_abcl__aggr__antsoc_003`

  - `mh_p_abcl__aggr__antsoc_004`

  - `mh_p_abcl__aggr__antsoc_005`

  - `mh_p_abcl__aggr__antsoc_006`

  - `mh_p_abcl__aggr__antsoc_007`

  - `mh_p_abcl__aggr__antsoc_008`

  - `mh_p_abcl__rule_001`

  - `mh_p_abcl__rule_002`

  - `mh_p_abcl__rule_003`

  - `mh_p_abcl__rule__adhd_001`

  - `mh_p_abcl__rule__antsoc_001`

  - `mh_p_abcl__rule__antsoc_002`

  - `mh_p_abcl__rule__antsoc_003`

  - `mh_p_abcl__rule__antsoc_004`

  - `mh_p_abcl__rule__antsoc_005`

  - `mh_p_abcl__rule__antsoc_006`

  - `mh_p_abcl__rule__antsoc_007`

  - `mh_p_abcl__rule__antsoc_008`

  - `mh_p_abcl__rule__antsoc_009`

  - `mh_p_abcl__intru_001`

  - `mh_p_abcl__intru_002`

  - `mh_p_abcl__intru_003`

  - `mh_p_abcl__intru_004`

  - `mh_p_abcl__intru_005`

  - `mh_p_abcl__intru_006`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 2 of 35 items missing

## Usage

``` r
compute_mh_p_abcl__synd__ext_tscore(
  data,
  data_norm = NULL,
  name = "mh_p_abcl__synd__ext_tscore",
  col_age = "mh_p_abcl__cg2__age_001",
  col_sex = "mh_p_abcl__cg2_sex",
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

[`compute_mh_p_abcl__synd__ext_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_abcl__synd__ext_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__synd__ext_tscore(data) |>
  select(
    any_of(c("mh_p_abcl__synd__ext_tscore", vars_mh_p_abcl__synd__ext))
  )
} # }
```
