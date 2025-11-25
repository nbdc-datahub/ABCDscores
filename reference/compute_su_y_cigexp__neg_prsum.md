# Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative expectancies): Prorated sum"

Computes the summary score `su_y_cigexp__neg_prsum` Cigarette
Expectancies (ASCQ) \[Youth\] (Strength of negative expectancies):
Prorated sum \[Validation: No more than 0 missing or declined\]

Note: all 0s are changed to NAs prior to calculating pro-rated sum

- *Summarized variables:*

  - `su_y_cigexp__neg_001`

  - `su_y_cigexp__neg_002`

- *Excluded values:*

  - 0

- *Validation criterion:* maximally 0 of 2 items missing

## Usage

``` r
vars_su_y_cigexp__neg

compute_su_y_cigexp__neg_prsum(
  data,
  name = "su_y_cigexp__neg_prsum",
  combine = TRUE,
  exclude = c("0"),
  max_na = 0
)
```

## Format

vars_su_y_cigexp\_\_neg is a character vector of all column names used
to compute summary score of `su_y_cigexp__neg_prsum` and
`su_y_cigexp__neg_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE` (default), the summary score will be appended to
  the input data frame. If `FALSE`, the summary score for each
  participant will be returned as a separate data frame. (Default: TRUE)

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

## Value

tbl. The input data frame with the summary score appended as a new
column.
