# Compute "Prodromal Psychosis Scale \[Youth\] (Current Distress Score)"

Computes the summary score `mh_y_pps__dist__curr_score` Prodromal
Psychosis Scale \[Youth\] (Current Distress Score)

For the current wave, if z-score of `mh_y_pps__severity_score`
normalized across all current participants in the assessment wave is ≥
1.96, set the value to "1"; else set the value to "0". If there is no
score for the current assessment wave,set the value to `NA` (missing).

- *Summarized variables:*

  - mh_y_pps\_\_severity_score (intermediate score)

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
compute_mh_y_pps__dist__curr_score(
  data,
  name = "mh_y_pps__dist__curr_score",
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

[`compute_mh_y_pps__severity_score()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__severity_score.md)
