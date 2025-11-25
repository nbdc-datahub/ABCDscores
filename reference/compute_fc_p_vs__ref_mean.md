# Compute "Values Scale \[Parent\] (Family as referent): Mean"

Computes the summary score `fc_p_vs__ref_mean` (Values Scale \[Parent\]
(Family as referent): Mean)

- *Summarized variables:*

  - `fc_p_vs__ref_001`

  - `fc_p_vs__ref_002`

  - `fc_p_vs__ref_003`

  - `fc_p_vs__ref_004`

  - `fc_p_vs__ref_005`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_fc_p_vs__ref

compute_fc_p_vs__ref_mean(
  data,
  name = "fc_p_vs__ref_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_vs\_\_ref is a character vector of all column names used to
compute summary score of `fc_p_vs__ref`.

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
