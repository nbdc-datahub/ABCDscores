# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of consciousness): Age of first injury with LOC - Number missing"

Computes the summary score `ph_p_otbi__loc__tbiage_nm` Ohio State
Traumatic Brain Injury Screen \[Parent\] (Loss of consciousness): Age of
first injury with LOC - Number missing

- *Excluded values:*

  - 777

  - 999

- *Notes:*

  - The output is set to `NA` when no head or neck injury/impact is
    reported

## Usage

``` r
compute_ph_p_otbi__loc__tbiage_nm(
  data,
  name = "ph_p_otbi__loc__tbiage_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

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

## See also

[`compute_ph_p_otbi__loc_tbiage()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_otbi__loc_tbiage.md)
