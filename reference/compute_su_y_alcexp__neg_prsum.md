# Compute "Alcohol Expectancies (AEQ-AB) \[Youth\] (Strength of negative expectancies): Prorated sum"

Computes the summary score `su_y_alcexp__neg_prsum` Alcohol Expectancies
(AEQ-AB) \[Youth\] (Strength of negative expectancies): Prorated sum

- *Summarized variables:*

  - `su_y_alcexp__neg_001`

  - `su_y_alcexp__neg_002`

  - `su_y_alcexp__neg_003`

- *Excluded values:* none

- *Validation criterion:* maximally 1 of 3 items missing

## Usage

``` r
vars_su_y_alcexp__neg

compute_su_y_alcexp__neg_prsum(
  data,
  name = "su_y_alcexp__neg_prsum",
  combine = TRUE,
  max_na = 1
)
```

## Format

vars_su_y_alcexp\_\_neg is a character vector of all column names used
to compute summary score of `su_y_alcexp__neg_prsum` and
`su_y_alcexp__neg_nm`

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

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

## Value

tbl. The input data frame with the summary score appended as a new
column.
