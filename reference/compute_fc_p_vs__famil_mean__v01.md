# Compute "Values Scale \[Parent\] (Familism): Mean - Version 1 (Year 5 onwards)"

Computes the summary score `fc_p_vs__famil_mean__v01` (Values Scale
\[Parent\] (Familism): Mean - Version 1 (Year 5 onwards))

- *Summarized variables:*

  - `fc_p_vs__supp_001`

  - `fc_p_vs__supp_002`

  - `fc_p_vs__supp_003`

  - `fc_p_vs__supp_004`

  - `fc_p_vs__supp_005`

  - `fc_p_vs__supp_006`

  - `fc_p_vs__ref_001`

  - `fc_p_vs__ref_002`

  - `fc_p_vs__ref_003`

  - `fc_p_vs__ref_004`

  - `fc_p_vs__ref_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:*

  - maximally 2 of 11 items missing

## Usage

``` r
vars_fc_p_vs__famil__v01

compute_fc_p_vs__famil_mean__v01(
  data,
  name = "fc_p_vs__famil_mean__v01",
  max_na = 2,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`fc_p_vs__famil_mean__v01` and `fc_p_vs__famil_nm__v01`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric vector of positive whole number. Number of missing items
  allowed (Default: 2).

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_fc_p_vs__famil_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_vs__famil_mean.md)
