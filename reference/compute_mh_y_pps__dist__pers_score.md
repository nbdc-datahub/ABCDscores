# Compute "Prodromal Psychosis Scale \[Youth\] (Persistent Distress Score)"

Computes the summary score `mh_y_pps__dist__pers_score` Prodromal
Psychosis Scale \[Youth\] (Persistent Distress Score)

For the last 3 consecutive waves (this wave, prior annual wave, and the
wave before that), if 2 or more waves have a
`mh_y_pps__dist__curr_score` of "1", then score is "1", else "0"; if
more than 1 `NA` values in the last 3 waves, then score is `NA`.

The persistent flag is derived from a padded annual timeline per
participant. Missing annual visits between observed sessions are treated
as `NA`, so each observed session evaluates the current wave plus the
two immediately preceding annual slots, even if data were not collected
for one of those visits. The special case where both `ses-00A` and
`ses-01A` meet the threshold (`1`) is also treated as persistent at
`ses-01A`.

- *Summarized variables:*

  - mh_y_pps\_\_dist\_\_curr_score (intermediate score)

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
compute_mh_y_pps__dist__pers_score(
  data,
  name = "mh_y_pps__dist__pers_score",
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_pps__dist__curr_score()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__dist__curr_score.md)
