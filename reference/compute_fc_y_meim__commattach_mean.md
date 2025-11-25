# Compute "The Multigroup Ethnic Identity Measure-Revised \[Youth\] (Commitment and attachment): Mean"

Computes the summary score `fc_y_meim__commattach_mean` (The Multigroup
Ethnic Identity Measure-Revised \[Youth\] (Commitment and attachment):
Mean)

- *Summarized variables:*

  - `fc_y_meim__commattach_001`

  - `fc_y_meim__commattach_002`

  - `fc_y_meim__commattach_003`

- *Excluded values:* none

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_y_meim__commattach

compute_fc_y_meim__commattach_mean(
  data,
  name = "fc_y_meim__commattach_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_y_meim\_\_commattach is a character vector of all column names
used to compute summary score of `fc_y_meim__commattach`.

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
