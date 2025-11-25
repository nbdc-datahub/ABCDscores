# Compute "Values Scale \[Parent\] (Religion): Mean"

Computes the summary score `fc_p_vs__relig_mean` (Values Scale
\[Parent\] (Religion): Mean)

- *Summarized variables:*

  - `fc_p_vs__relig_001`

  - `fc_p_vs__relig_002`

  - `fc_p_vs__relig_003`

  - `fc_p_vs__relig_004`

  - `fc_p_vs__relig_005`

  - `fc_p_vs__relig_006`

  - `fc_p_vs__relig_007`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 7 items missing

## Usage

``` r
vars_fc_p_vs__relig

compute_fc_p_vs__relig_mean(
  data,
  name = "fc_p_vs__relig_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_vs\_\_relig is a character vector of all column names used to
compute summary score of `fc_p_vs__relig`.

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
