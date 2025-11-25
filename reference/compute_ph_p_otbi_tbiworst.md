# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\]: Worst injury overall"

Computes the summary score `ph_p_otbi_tbiworst` Ohio State Traumatic
Brain Injury Screen \[Parent\]: Worst injury overall

- *Summarized variables:*

  - `ph_p_otbi_001`

  - `ph_p_otbi_002`

  - `ph_p_otbi_003`

  - `ph_p_otbi_004`

  - `ph_p_otbi_005`

  - `ph_p_otbi__loc__add_001`

  - `ph_p_otbi__rpt_001`

  - `ph_p_otbi_001__l`

  - `ph_p_otbi_002__l`

  - `ph_p_otbi_003__l`

  - `ph_p_otbi_004__l`

  - `ph_p_otbi_005__l`

  - `ph_p_otbi__loc__add_001__l`

  - `ph_p_otbi__rpt_001__l`

  - `ph_p_otbi__loc_001`

  - `ph_p_otbi__loc_002`

  - `ph_p_otbi__loc_003`

  - `ph_p_otbi__loc_004`

  - `ph_p_otbi__loc_005`

  - `ph_p_otbi__daz_001`

  - `ph_p_otbi__daz_002`

  - `ph_p_otbi__daz_003`

  - `ph_p_otbi__daz_004`

  - `ph_p_otbi__daz_005`

  - `ph_p_otbi__rpt__loc_001`

  - `ph_p_otbi__rpt__daz_001`

  - `ph_p_otbi__rpt_002`

  - `ph_p_otbi__rpt__loc__daz_002`

  - `ph_p_otbi__rpt_003`

  - `ph_p_otbi__rpt__loc__daz_003`

  - `ph_p_otbi__loc_001__l`

  - `ph_p_otbi__loc_002__l`

  - `ph_p_otbi__loc_003__l`

  - `ph_p_otbi__loc_004__l`

  - `ph_p_otbi__loc_005__l`

  - `ph_p_otbi__daz_001__l`

  - `ph_p_otbi__daz_002__l`

  - `ph_p_otbi__daz_003__l`

  - `ph_p_otbi__daz_004__l`

  - `ph_p_otbi__daz_005__l`

  - `ph_p_otbi__rpt__loc_001__l`

  - `ph_p_otbi__rpt__daz_001__l`

  - `ph_p_otbi__loc__add_001__02`

  - `ph_p_otbi__loc__add_001__03`

  - `ph_p_otbi__loc__add_001__02__l`

  - `ph_p_otbi__loc__add_001__03__l`

- *Excluded values:*

  - 777

  - 999

- *Notes:*

  - Computed using the following summary scores:

    - ph_p_otbi\_\_tbi1a

    - ph_p_otbi\_\_tbi1b

    - ph_p_otbi\_\_tbi2

    - ph_p_otbi\_\_tbi3

    - ph_p_otbi\_\_tbi4

    - ph_p_otbi\_\_tbi5

## Usage

``` r
vars_ph_p_otbi_tbiworst

compute_ph_p_otbi_tbiworst(
  data,
  name = "ph_p_otbi_tbiworst",
  keep_summaries = FALSE,
  combine = TRUE
)
```

## Format

vars_ph_p_otbi_tbiworst is a character vector of all column names used
to compute summary score of `ph_p_otbi_tbiworst`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- keep_summaries:

  logical. If `TRUE`, intermediate columns created to compute the
  summary score will be retained. If `FALSE`, the intermediate columns
  will be removed. Default set to `FALSE`.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. The input data frame with the summary score(s) appended as a new
column.
