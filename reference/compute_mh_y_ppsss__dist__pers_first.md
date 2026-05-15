# Compute "Prodromal Psychosis Scale \[Youth\] (First Persistent Distress)"

Static Prodromal Psychosis Scale \[Youth\] (First Persistent Distress):
Session when criteria first met

- *Summarized variables:*

  - mh_y_pps\_\_dist\_\_pers_score (intermediate score)

- *Excluded values:* none

- *Validation criterion:* none

This function creates a static variable from longitudinal data.

## Usage

``` r
compute_mh_y_ppsss__dist__pers_first(
  data,
  name = "mh_y_ppsss__dist__pers_first"
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

[`compute_mh_y_pps__dist__pers_score()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__dist__pers_score.md)
