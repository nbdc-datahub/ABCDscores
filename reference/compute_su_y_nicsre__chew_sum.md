# Compute "Nicotine Subjective Response and Effects \[Youth\] (Intensity of positive and negative effects of first smokeless tobacco or chew use): Sum - Negative score inverted \[Validation: None missing or declined\]"

Computes the summary score `su_y_nicsre__chew_sum` Nicotine Subjective
Response and Effects \[Youth\] (Intensity of positive and negative
effects of first smokeless tobacco or chew use): Sum - Negative score
inverted \[Validation: None missing or declined\]

- *Summarized variables:*

  - `su_y_nicsre__chew__pos_001`

  - `su_y_nicsre__chew__neg_001`

- *Excluded values:* none

- *Validation criterion:* maximally 0 of 2 items missing

## Usage

``` r
vars_su_y_nicsre__chew

compute_su_y_nicsre__chew_sum(
  data,
  name = "su_y_nicsre__chew_sum",
  combine = TRUE,
  max_na = 0
)
```

## Format

vars_su_y_nicsre\_\_chew is a character vector of all column names used
to compute summary scores of `compute_su_y_nicsre__chew` (`_sum`,
`_nm`).

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
