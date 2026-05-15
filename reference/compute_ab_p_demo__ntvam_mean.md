# Compute "Demographics \[Parent\] (Native American Acculturation): Mean"

Computes the summary score `ab_p_demo__ntvam_mean` (Demographics
\[Parent\] (Native American Acculturation): Mean)

- *Summarized variables:*

  - `ab_p_demo__ntvam_005`

  - `ab_p_demo__ntvam_006`

  - `ab_p_demo__ntvam_007`

- *Excluded values:*

  - 999

- *Validation criterion:* maximally 0 of 3 items missing

## Usage

``` r
vars_ab_p_demo__ntvam

compute_ab_p_demo__ntvam_mean(
  data,
  name = "ab_p_demo__ntvam_mean",
  max_na = 0,
  exclude = c("999"),
  combine = TRUE
)
```

## Format

vars_ab_p_demo\_\_ntvam is a character vector of all column names used
to compute summary score of `ab_p_demo__ntvam`.

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
