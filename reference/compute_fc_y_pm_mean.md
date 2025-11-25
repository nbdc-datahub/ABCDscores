# Compute "Parental Monitoring \[Youth\]: Mean"

Computes the summary score `fc_y_pm_mean` (Parental Monitoring
\[Youth\]: Mean)

- *Summarized variables:*

  - `fc_y_pm_001`

  - `fc_y_pm_002`

  - `fc_y_pm_003`

  - `fc_y_pm_004`

  - `fc_y_pm_005`

- *Excluded values:*

  - 777

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_fc_y_pm

compute_fc_y_pm_mean(data, name = "fc_y_pm_mean", max_na = 1, combine = TRUE)
```

## Format

vars_fc_y_pm is a character vector of all column names used to compute
summary score of `fc_y_pm`.

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
