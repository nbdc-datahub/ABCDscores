# Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of positive expectancies): Prorated sum"

Computes the summary score `su_y_cigexp__pos_prsum` Cigarette
Expectancies (ASCQ) \[Youth\] (Strength of positive expectancies):
Prorated sum

Note: all 0s are changed to NAs prior to calculating pro-rated sum

- *Summarized variables:*

  - `su_y_cigexp__pos_001`

  - `su_y_cigexp__pos_002`

  - `su_y_cigexp__pos_003`

  - `su_y_cigexp__pos_004`

- *Excluded values:*

  - 0

- *Validation criterion:* maximally 2 of 4 items missing

## Usage

``` r
vars_su_y_cigexp__pos

compute_su_y_cigexp__pos_prsum(
  data,
  name = "su_y_cigexp__pos_prsum",
  combine = TRUE,
  exclude = c("0"),
  max_na = 2
)
```

## Format

vars_su_y_cigexp\_\_pos is a character vector of all column names used
to compute summary score of `su_y_cigexp__pos_prsum` and
`su_y_cigexp__pos_nm`.

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
