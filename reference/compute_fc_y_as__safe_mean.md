# Compute "Activity Space \[Youth\] (Safety): Mean"

Computes the summary score `fc_y_as__safe_mean` (Activity Space
\[Youth\] (Safety): Mean)

- *Summarized variables:*

  - `fc_y_as__safe_001a`

  - `fc_y_as__safe_001b`

  - `fc_y_as__safe_001c`

- *Excluded values:* none

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_y_as__safe

compute_fc_y_as__safe_mean(
  data,
  name = "fc_y_as__safe_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_y_as\_\_safe is a character vector of all column names used to
compute summary score of `fc_y_as__safe`.

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
