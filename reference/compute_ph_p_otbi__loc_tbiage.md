# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Loss of consciousness): Age of first injury with LOC"

Computes the summary score `ph_p_otbi__loc_tbiage` Ohio State Traumatic
Brain Injury Screen \[Parent\] (Loss of consciousness): Age of first
injury with LOC

- *Summarized variables:*

  - `ph_p_otbi_001`

  - `ph_p_otbi__loc_001`

  - `ph_p_otbi__age_001`

  - `ph_p_otbi_002`

  - `ph_p_otbi__loc_002`

  - `ph_p_otbi__age_002`

  - `ph_p_otbi_003`

  - `ph_p_otbi__loc_003`

  - `ph_p_otbi__age_003`

  - `ph_p_otbi_004`

  - `ph_p_otbi__loc_004`

  - `ph_p_otbi__age_004`

  - `ph_p_otbi_005`

  - `ph_p_otbi__loc_005`

  - `ph_p_otbi__age_005`

  - `ph_p_otbi__loc__add_001`

  - `ph_p_otbi__loc__add_001__04`

  - `ph_p_otbi__rpt_001`

  - `ph_p_otbi__rpt__loc_001`

  - `ph_p_otbi__rpt__age_001a`

  - `ph_p_otbi__rpt_002`

  - `ph_p_otbi__rpt__loc__daz_002`

  - `ph_p_otbi__rpt__age_002a`

  - `ph_p_otbi__rpt_003`

  - `ph_p_otbi__rpt__loc__daz_003`

  - `ph_p_otbi__rpt__age_003a`

  - `ph_p_otbi_001__l`

  - `ph_p_otbi__loc_001__l`

  - `ph_p_otbi__age_001__l`

  - `ph_p_otbi_002__l`

  - `ph_p_otbi__loc_002__l`

  - `ph_p_otbi__age_002__l`

  - `ph_p_otbi_003__l`

  - `ph_p_otbi__loc_003__l`

  - `ph_p_otbi__age_003__l`

  - `ph_p_otbi_004__l`

  - `ph_p_otbi__loc_004__l`

  - `ph_p_otbi__age_004__l`

  - `ph_p_otbi_005__l`

  - `ph_p_otbi__loc_005__l`

  - `ph_p_otbi__age_005__l`

  - `ph_p_otbi__loc__add_001__l`

  - `ph_p_otbi__loc__add_001__04__l`

  - `ph_p_otbi__rpt_001__l`

  - `ph_p_otbi__rpt__loc_001__l`

  - `ph_p_otbi__rpt__age_001a__l`

- *Excluded values:*

  - 777

  - 999

  - any reported age less than or equal to 0

- *Notes:*

  - The output is set to `NA` for the following cases:

    - minimum age is less than 0

    - minimum age is higher than age at visit

    - no head or neck injury/impact is reported

## Usage

``` r
vars_ph_p_otbi__loc_tbiage

compute_ph_p_otbi__loc_tbiage(
  data,
  name = "ph_p_otbi__loc_tbiage",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

vars_ph_p_otbi\_\_loc_tbiage is a character vector of all column names
used to compute summary score of `ph_p_otbi__loc_tbiage`.

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
