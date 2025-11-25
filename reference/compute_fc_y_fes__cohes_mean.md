# Compute "Family Environment Scale \[Youth\] (Cohesion): Mean"

Computes the summary score `fc_y_fes__cohes_mean` (Family Environment
Scale \[Youth\] (Cohesion): Mean)

- *Summarized variables:*

  - `fc_y_fes__cohes_001`

  - `fc_y_fes__cohes_002`

  - `fc_y_fes__cohes_003`

  - `fc_y_fes__cohes_004`

  - `fc_y_fes__cohes_005`

  - `fc_y_fes__cohes_006`

  - `fc_y_fes__cohes_007`

  - `fc_y_fes__cohes_008`

  - `fc_y_fes__cohes_009`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 9 items missing

## Usage

``` r
vars_fc_y_fes__cohes

compute_fc_y_fes__cohes_mean(
  data,
  name = "fc_y_fes__cohes_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_y_fes\_\_cohes is a character vector of all column names used to
compute summary score of `fc_y_fes__cohes`.

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
