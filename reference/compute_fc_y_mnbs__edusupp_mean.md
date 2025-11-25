# Compute "Multidimensional Neglectful Behavior Scale \[Youth\] (Education support): Mean"

Computes the summary score `fc_y_mnbs__edusupp_mean` (Multidimensional
Neglectful Behavior Scale \[Youth\] (Education support): Mean)

- *Summarized variables:*

  - `fc_y_mnbs__edusupp_001`

  - `fc_y_mnbs__edusupp_002`

  - `fc_y_mnbs__edusupp_003`

- *Excluded values:*

  - 777

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_y_mnbs__edusupp

compute_fc_y_mnbs__edusupp_mean(
  data,
  name = "fc_y_mnbs__edusupp_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_y_mnbs\_\_edusupp is a character vector of all column names used
to compute summary score of `fc_y_mnbs__edusupp`.

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
