# Compute "Children's Report of Parental Behavioral Inventory \[Youth\] (Caregiver A): Mean"

Computes the summary score `fc_y_crpbi__cg1_mean` (Children's Report of
Parental Behavioral Inventory \[Youth\] (Caregiver A): Mean)

- *Summarized variables:*

  - `fc_y_crpbi__cg1_002`

  - `fc_y_crpbi__cg1_003`

  - `fc_y_crpbi__cg1_004`

  - `fc_y_crpbi__cg1_005`

  - `fc_y_crpbi__cg1_006`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 5 items missing

## Usage

``` r
vars_fc_y_crpbi__cg1

compute_fc_y_crpbi__cg1_mean(
  data,
  name = "fc_y_crpbi__cg1_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_y_crpbi\_\_cg1 is a character vector of all column names used to
compute summary score of `fc_y_crpbi__cg1`.

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
