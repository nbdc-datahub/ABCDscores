# Compute "The Multigroup Ethnic Identity Measure-Revised \[Parent\] (Exploration): Mean"

Computes the summary score `fc_p_meim__explor_mean` (The Multigroup
Ethnic Identity Measure-Revised \[Parent\] (Exploration): Mean)

- *Summarized variables:*

  - `fc_p_meim__explor_001`

  - `fc_p_meim__explor_002`

  - `fc_p_meim__explor_003`

- *Excluded values:* none

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_p_meim__explor

compute_fc_p_meim__explor_mean(
  data,
  name = "fc_p_meim__explor_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_p_meim\_\_explor is a character vector of all column names used
to compute summary score of `fc_p_meim__explor`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 0).

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
