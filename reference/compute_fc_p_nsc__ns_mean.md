# Compute "Neighborhood Safety & Crime \[Parent\] (Neighborhood safety): Mean"

Computes the summary score `fc_p_nsc__ns_mean` (Neighborhood Safety &
Crime \[Parent\] (Neighborhood safety): Mean)

- *Summarized variables:*

  - `fc_p_nsc__ns_001`

  - `fc_p_nsc__ns_002`

  - `fc_p_nsc__ns_003`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_p_nsc__ns

compute_fc_p_nsc__ns_mean(
  data,
  name = "fc_p_nsc__ns_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_p_nsc\_\_ns is a character vector of all column names used to
compute summary score of `fc_p_nsc__ns`.

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
