# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Number of missing gating items"

Computes the summary score `ph_p_otbi_nm` Ohio State Traumatic Brain
Injury Screen \[Parent\]: Number of missing gating items

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_ph_p_otbi

compute_ph_p_otbi_nm(
  data,
  name = "ph_p_otbi_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

vars_ph_p_otbi is a character vector of all column names used to compute
summary score of `ph_p_otbi_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.
