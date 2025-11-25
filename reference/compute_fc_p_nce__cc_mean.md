# Compute "Neighborhood Collective Efficacy \[Parent\] (Community cohesion): Mean"

Computes the summary score `fc_p_nce__cc_mean` (Neighborhood Collective
Efficacy \[Parent\] (Community cohesion): Mean)

- *Summarized variables:*

  - `fc_p_nce__cc_001`

  - `fc_p_nce__cc_002`

  - `fc_p_nce__cc_003`

  - `fc_p_nce__cc_004`

  - `fc_p_nce__cc_005`

- *Excluded values:*

  - 777

- *Validation criterion:* maximally 1 of 5 items missing

- *Notes:*

  - The following variables are reverse coded before computing the
    summary score:

    - `fc_p_nce__cc_003`

    - `fc_p_nce__cc_004`

  - The value "99" (Don't know) is recoded to "3" (Neither... nor...)

## Usage

``` r
vars_fc_p_nce__cc

compute_fc_p_nce__cc_mean(
  data,
  name = "fc_p_nce__cc_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_nce\_\_cc is a character vector of all column names used to
compute summary score of `fc_p_nce__cc`.

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
