# Compute "Cohort description: Household income - 6 levels"

Computes the summary score `ab_g_dyn__cohort_income__hhold__6lvl` Cohort
description: Household income - 6 levels

- *Summarized variables:*

  - `ab_p_demo__income__hhold_001`

  - `ab_p_demo__income__hhold_001__v01`

## Usage

``` r
vars_ab_g_dyn__cohort_income__hhold__6lvl

compute_ab_g_dyn__cohort_income__hhold__6lvl(
  data,
  name = "ab_g_dyn__cohort_income__hhold__6lvl",
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`ab_g_dyn__cohort_income__hhold__6lvl`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score for each participant will be
  returned as a separate data frame. (Default: FALSE)

## Value

tbl. The input data frame with the summary score appended as a new
column.
