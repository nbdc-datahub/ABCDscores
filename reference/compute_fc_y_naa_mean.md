# Compute "Native American Acculturation \[Youth\]: Mean"

Computes the summary score `fc_y_naa_mean` (Native American
Acculturation \[Youth\]: Mean)

- *Summarized variables:*

  - `fc_y_naa_001`

  - `fc_y_naa_002`

  - `fc_y_naa_003`

- *Excluded values:*

  - 999

- *Validation criterion:* maximally 0 of 3 items missing

## Usage

``` r
vars_fc_y_naa

compute_fc_y_naa_mean(
  data,
  name = "fc_y_naa_mean",
  max_na = 0,
  exclude = c("999"),
  combine = TRUE
)
```

## Format

vars_fc_y_naa is a character vector of all column names used to compute
summary score of `fc_y_naa`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed.

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
