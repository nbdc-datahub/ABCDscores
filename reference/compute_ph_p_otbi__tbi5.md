# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Severe TBI"

Computes the summary score `ph_p_otbi__tbi5` Ohio State Traumatic Brain
Injury Screen \[Parent\]: Severe TBI

- *Summarized variables:*

  - `ph_p_otbi_001`

  - `ph_p_otbi_002`

  - `ph_p_otbi_003`

  - `ph_p_otbi_004`

  - `ph_p_otbi_005`

  - `ph_p_otbi__loc_001`

  - `ph_p_otbi__loc_002`

  - `ph_p_otbi__loc_003`

  - `ph_p_otbi__loc_004`

  - `ph_p_otbi__loc_005`

  - `ph_p_otbi__loc__add_001`

  - `ph_p_otbi__loc__add_001__02`

  - `ph_p_otbi__loc__add_001__03`

  - `ph_p_otbi__rpt_001`

  - `ph_p_otbi__rpt__loc_001`

  - `ph_p_otbi_001__l`

  - `ph_p_otbi_002__l`

  - `ph_p_otbi_003__l`

  - `ph_p_otbi_004__l`

  - `ph_p_otbi_005__l`

  - `ph_p_otbi__loc_001__l`

  - `ph_p_otbi__loc_002__l`

  - `ph_p_otbi__loc_003__l`

  - `ph_p_otbi__loc_004__l`

  - `ph_p_otbi__loc_005__l`

  - `ph_p_otbi__loc__add_001__l`

  - `ph_p_otbi__loc__add_001__02__l`

  - `ph_p_otbi__loc__add_001__03__l`

  - `ph_p_otbi__rpt_001__l`

  - `ph_p_otbi__rpt__loc_001__l`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_ph_p_otbi__tbi5(
  data,
  name = "ph_p_otbi__tbi5",
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

[`compute_ph_p_otbi__tbi3()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_otbi__tbi3.md)
