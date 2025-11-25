# Compute "Values Scale \[Parent\] (Independence and self-reliance): Mean"

Computes the summary score `fc_p_vs__indselfrel_mean` (Values Scale
\[Parent\] (Independence and self-reliance): Mean)

- *Summarized variables:*

  - `fc_p_vs__indselfrel_001`

  - `fc_p_vs__indselfrel_002`

  - `fc_p_vs__indselfrel_003`

  - `fc_p_vs__indselfrel_004`

  - `fc_p_vs__indselfrel_005`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_fc_p_vs__indselfrel

compute_fc_p_vs__indselfrel_mean(
  data,
  name = "fc_p_vs__indselfrel_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_vs\_\_indselfrel is a character vector of all column names
used to compute summary score of `fc_p_vs__indselfrel`.

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
