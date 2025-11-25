# Compute "Family Environment Scale \[Parent\] (Expression): Mean"

Computes the summary score `fc_p_fes__expr_mean` (Family Environment
Scale \[Parent\] (Expression): Mean)

- *Summarized variables:*

  - `fc_p_fes__expr_001`

  - `fc_p_fes__expr_002`

  - `fc_p_fes__expr_003`

  - `fc_p_fes__expr_004`

  - `fc_p_fes__expr_005`

  - `fc_p_fes__expr_006`

  - `fc_p_fes__expr_007`

  - `fc_p_fes__expr_008`

  - `fc_p_fes__expr_009`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 9 items missing

## Usage

``` r
vars_fc_p_fes__expr

compute_fc_p_fes__expr_mean(
  data,
  name = "fc_p_fes__expr_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_fes\_\_expr is a character vector of all column names used to
compute summary score of `fc_p_fes__expr`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
