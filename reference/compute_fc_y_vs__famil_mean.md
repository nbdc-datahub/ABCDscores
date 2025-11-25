# Compute "Values Scale \[Youth\] (Familism): Mean - Baseline to Year 5"

Computes the summary score `fc_y_vs__famil_mean` (Values Scale \[Youth\]
(Familism): Mean - Baseline to Year 5)

- *Summarized variables:*

  - `fc_y_vs__supp_001`

  - `fc_y_vs__supp_002`

  - `fc_y_vs__supp_003`

  - `fc_y_vs__supp_004`

  - `fc_y_vs__supp_005`

  - `fc_y_vs__supp_006`

  - `fc_y_vs__ref_001`

  - `fc_y_vs__ref_002`

  - `fc_y_vs__ref_003`

  - `fc_y_vs__ref_004`

  - `fc_y_vs__ref_005`

  - `fc_y_vs__obl_001`

  - `fc_y_vs__obl_002`

  - `fc_y_vs__obl_003`

  - `fc_y_vs__obl_004`

  - `fc_y_vs__obl_005`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:*

  - maximally 3 of 16 items missing

## Usage

``` r
vars_fc_y_vs__famil

compute_fc_y_vs__famil_mean(
  data,
  name = "fc_y_vs__famil_mean",
  max_na = 3,
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`fc_y_vs__famil_mean` and `fc_y_vs__famil_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric vector of positive whole number. Number of missing items
  allowed (Default: 3).

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
