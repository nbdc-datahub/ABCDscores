# Compute "Cohort description: Highest education across caregivers"

Computes the summary score `ab_g_dyn__cohort_edu__cgs` Cohort
description: Highest education across caregivers

- *Summarized variables:*

  - `ab_p_demo__edu__slf_001`

  - `ab_p_demo__edu__slf_001__v01`

  - `ab_p_demo__edu__slf_001__v02`

  - `ab_p_demo__edu__prtnr_001`

  - `ab_p_demo__edu__prtnr_001__v01`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_ab_g_dyn__cohort_edu__cgs

compute_ab_g_dyn__cohort_edu__cgs(
  data,
  name = "ab_g_dyn__cohort_edu__cgs",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`ab_g_dyn__cohort_edu__cgs`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score for each participant will be
  returned as a separate data frame. (Default: FALSE)

## Value

tbl. The input data frame with the summary score appended as a new
column.
