# Compute "Prodromal Psychosis Scale \[Youth\] (Current Distress Count)"

Computes the summary score `mh_y_ppsss__dist__curr_count` Prodromal
Psychosis Scale \[Youth\] (Current Distress Count): Number of times
criteria met.

This function creates a static variable from longitudinal data.

- *Summarized variables:*

  - mh_y_pps\_\_dist\_\_curr_score (intermediate score)

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
compute_mh_y_ppsss__dist__curr_count(
  data,
  name = "mh_y_ppsss__dist__curr_count"
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

## Value

a tibble of the `participant_id` column and the new static column

## See also

[`compute_mh_y_pps__dist__curr_score()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__dist__curr_score.md)
