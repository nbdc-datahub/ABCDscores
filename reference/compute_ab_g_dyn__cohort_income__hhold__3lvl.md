# Compute "Cohort description: Household income - 3 levels"

Computes the summary score `ab_g_dyn__cohort_income__hhold__3lvl` Cohort
description: Household income - 3 levels

- *Summarized variables:*

  - `ab_p_demo__income__hhold_001`

  - `ab_p_demo__income__hhold_001__v01`

## Usage

``` r
compute_ab_g_dyn__cohort_income__hhold__3lvl(
  data,
  name = "ab_g_dyn__cohort_income__hhold__3lvl",
  combine = TRUE
)
```

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

## See also

[`compute_ab_g_dyn__cohort_income__hhold__6lvl()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ab_g_dyn__cohort_income__hhold__6lvl.md)
