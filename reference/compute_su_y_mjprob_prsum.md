# Compute "Marijuana Problem Index (MAPI) \[Youth\]: Prorated sum"

Computes the summary score `su_y_mjprob_prsum` Marijuana Problem Index
(MAPI) \[Youth\]: Prorated sum \[Validation: No more than 3 missing or
declined\]

- *Summarized variables:*

  - `su_y_mjprob_001`

  - `su_y_mjprob_002`

  - `su_y_mjprob_003`

  - `su_y_mjprob_004`

  - `su_y_mjprob_005`

  - `su_y_mjprob_006`

  - `su_y_mjprob_007`

  - `su_y_mjprob_008`

  - `su_y_mjprob_009`

  - `su_y_mjprob_010`

  - `su_y_mjprob_011`

  - `su_y_mjprob_012`

  - `su_y_mjprob_016`

  - `su_y_mjprob_017`

  - `su_y_mjprob_018`

- *Excluded values:* none

- *Validation criterion:* maximally 3 items missing

## Usage

``` r
vars_su_y_mjprob

compute_su_y_mjprob_prsum(
  data,
  name = "su_y_mjprob_prsum",
  combine = TRUE,
  max_na = 3
)
```

## Format

vars_su_y_mjprob is a character vector of all column names used to
compute summary score of `su_y_mjprob_prsum` and `su_y_mjprob_nm`.

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
