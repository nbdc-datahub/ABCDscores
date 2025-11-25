# Compute "Cohort description: Caregivers' partnership and employment status"

Computes the summary score `ab_g_dyn__cohort_prtnrshp__employ` Cohort
description: Caregivers' partnership and employment status

- *Summarized variables:*

  - `ab_p_demo__marital__slf_001`

  - `ab_p_demo__prtnr_001`

  - `ab_p_demo__empl__slf_001`

  - `ab_p_demo__empl__prtnr_001`

  - `ab_p_demo__empl__prtnr_001__v01`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_ab_g_dyn__cohort_prtnrshp__employ

compute_ab_g_dyn__cohort_prtnrshp__employ(
  data,
  name = "ab_g_dyn__cohort_prtnrshp__employ",
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`ab_g_dyn__cohort_prtnrshp__employ`.

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
