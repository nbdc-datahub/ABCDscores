# Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Other problems): Sum"

Computes the summary score `mh_p_abcl__synd__othpr_sum` Adult Behavior
Checklist \[Parent\] (Syndrome Scale - Other problems): Sum

- *Summarized variables:*

  - `mh_p_abcl__othpr_001`

  - `mh_p_abcl__othpr_002`

  - `mh_p_abcl__othpr_003`

  - `mh_p_abcl__othpr_004`

  - `mh_p_abcl__othpr_005`

  - `mh_p_abcl__othpr_006`

  - `mh_p_abcl__othpr_007`

  - `mh_p_abcl__othpr_008`

  - `mh_p_abcl__othpr_009`

  - `mh_p_abcl__othpr_010`

  - `mh_p_abcl__othpr_011`

  - `mh_p_abcl__othpr_012`

  - `mh_p_abcl__othpr__adhd_001`

  - `mh_p_abcl__othpr__adhd_002`

  - `mh_p_abcl__othpr__adhd_003`

  - `mh_p_abcl__othpr__adhd_004`

  - `mh_p_abcl__othpr__antsoc_001`

  - `mh_p_abcl__othpr__antsoc_002`

  - `mh_p_abcl__othpr__anx_001`

  - `mh_p_abcl__othpr__anx_002`

  - `mh_p_abcl__othpr__anx_003`

  - `mh_p_abcl__othpr__avoid_001`

  - `mh_p_abcl__othpr__dep_001`

  - `mh_p_abcl__othpr__dep_002`

  - `mh_p_abcl__othpr__dep_003`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 25 items missing

## Usage

``` r
compute_mh_p_abcl__synd__othpr_sum(
  data,
  name = "mh_p_abcl__synd__othpr_sum",
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

[`compute_mh_p_abcl__synd__othpr_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_abcl__synd__othpr_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__synd__othpr_sum(data) |>
  select(
    any_of(c("mh_p_abcl__synd__othpr_sum", vars_mh_p_abcl__synd__othpr))
  )
} # }
```
