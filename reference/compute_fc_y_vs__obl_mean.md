# Compute "Values Scale \[Youth\] (Family obligation): Mean"

Computes the summary score `fc_y_vs__obl_mean` (Values Scale \[Youth\]
(Family obligation): Mean)

- *Summarized variables:*

  - `fc_y_vs__obl_001`

  - `fc_y_vs__obl_002`

  - `fc_y_vs__obl_003`

  - `fc_y_vs__obl_004`

  - `fc_y_vs__obl_005`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_fc_y_vs__obl

compute_fc_y_vs__obl_mean(
  data,
  name = "fc_y_vs__obl_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_y_vs\_\_obl is a character vector of all column names used to
compute summary score of `fc_y_vs__obl`.

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
