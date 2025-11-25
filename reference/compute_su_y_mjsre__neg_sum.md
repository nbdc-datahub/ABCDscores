# Compute "Marijuana Subjective Response and Effects \[Youth\] (Negative): Sum \[Validation: None missing or declined\]"

Computes the summary score `su_y_mjsre__neg_sum` Marijuana Subjective
Response and Effects \[Youth\] (Negative): Sum \[Validation: None
missing or declined\]

- *Summarized variables:*

  - `su_y_mjsre__neg_001`

  - `su_y_mjsre__neg_002`

  - `su_y_mjsre__neg_003`

  - `su_y_mjsre__neg_004`

  - `su_y_mjsre__neg_005`

  - `su_y_mjsre__neg_006`

  - `su_y_mjsre__neg_007`

  - `su_y_mjsre__neg_008`

- *Excluded values:* none

- *Validation criterion:* maximally 0 of 8 items missing

## Usage

``` r
vars_su_y_mjsre__neg

compute_su_y_mjsre__neg_sum(
  data,
  name = "su_y_mjsre__neg_sum",
  combine = TRUE,
  max_na = 0
)
```

## Format

vars_su_y_mjsre\_\_neg is a character vector of all column names used to
compute summary scores of `compute_su_y_mjsre__neg` (`_sum`, `_nm`).

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 0).

## Value

tbl. The input data frame with the summary score appended as a new
column.
