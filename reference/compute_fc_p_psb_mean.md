# Compute "Prosocial Behavior \[Parent\]: Mean"

Computes the summary score `fc_p_psb_mean` (Prosocial Behavior
\[Parent\]: Mean)

- *Summarized variables:*

  - `fc_p_psb_001`

  - `fc_p_psb_002`

  - `fc_p_psb_003`

- *Excluded values:* none

- *Validation criterion:* none of 3 items missing

## Usage

``` r
vars_fc_p_psb

compute_fc_p_psb_mean(data, name = "fc_p_psb_mean", max_na = 0, combine = TRUE)
```

## Format

vars_fc_p_psb is a character vector of all column names used to compute
summary score of `fc_p_psb`.

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
