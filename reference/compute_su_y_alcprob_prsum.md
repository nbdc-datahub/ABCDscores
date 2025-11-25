# Compute "Alcohol Problem Index (RAPI) \[Youth\]: Prorated sum"

Computes the summary score `su_y_alcprob_prsum` Alcohol Problem Index
(RAPI) \[Youth\]: Prorated sum \[Validation: No more than 2 missing or
declined\]

- *Summarized variables:*

  - `su_y_alcprob_001`

  - `su_y_alcprob_002`

  - `su_y_alcprob_003`

  - `su_y_alcprob_004`

  - `su_y_alcprob_005`

  - `su_y_alcprob_006`

  - `su_y_alcprob_007`

  - `su_y_alcprob_008`

  - `su_y_alcprob_009`

  - `su_y_alcprob_010`

  - `su_y_alcprob_012`

  - `su_y_alcprob_016`

  - `su_y_alcprob_017`

  - `su_y_alcprob_018`

  - `su_y_alcprob_001__l`

  - `su_y_alcprob_002__l`

  - `su_y_alcprob_003__l`

  - `su_y_alcprob_004__l`

  - `su_y_alcprob_005__l`

  - `su_y_alcprob_006__l`

  - `su_y_alcprob_007__l`

  - `su_y_alcprob_008__l`

  - `su_y_alcprob_009__l`

  - `su_y_alcprob_010__l`

  - `su_y_alcprob_012__l`

  - `su_y_alcprob_016__l`

  - `su_y_alcprob_017__l`

  - `su_y_alcprob_018__l`

- *Excluded values:* none

- *Validation criterion:* maximally 2 items missing

## Usage

``` r
vars_su_y_alcprob

compute_su_y_alcprob_prsum(
  data,
  name = "su_y_alcprob_prsum",
  combine = TRUE,
  max_na = 2
)
```

## Format

vars_su_y_alcprob is a table with pairs of baseline and longitudinal
redcap fields used to compute summary score of `su_y_alcprob_prsum` and
`su_y_alcprob_nm`.

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
