# Compute "Cohort description: Ethno-racial identity (15 level classification from fc_p_meim_001) \[Based on baseline response; missingness filled in from longitudinal responses\]"

Computes the summary score `ab_g_stc__cohort_ethnrace__meim` Cohort
description: Ethno-racial identity (15 level classification from
fc_p_meim_001) \[Based on baseline response; missingness filled in from
longitudinal responses\]

- *Summarized variables:*

  - `fc_p_meim_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_ab_g_stc__cohort_ethnrace__meim

compute_ab_g_stc__cohort_ethnrace__meim(
  data,
  name = "ab_g_stc__cohort_ethnrace__meim",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

a character vector of all column names used to compute summary score of
`ab_g_stc__cohort_ethnrace__meim`.

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
column (default). If `combine == FALSE`, a data frame with two columns:
participant ID and summary score.
