# Compute "Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\] (Female): Approximate tanner stages"

Computes the summary score `ph_p_pds__f_categ` Pubertal Development
Scale & Menstrual Cycle Survey History \[Parent\] (Female): Approximate
tanner stages \[Validation: No more than 0 missing or declined\]

- *Summarized variables:*

  - `ph_p_pds_002`

  - `ph_p_pds__f_001`

  - `ph_p_pds__f_002`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 items missing

## Usage

``` r
vars_ph_p_pds__f_categ

compute_ph_p_pds__f_categ(
  data,
  name = "ph_p_pds__f_categ",
  exclude = c("777", "999"),
  combine = TRUE,
  max_na = 0
)
```

## Format

vars_ph_p_pds\_\_f is a character vector of all column names used to
compute summary score of `ph_p_pds__f_categ` and
`ph_p_pds__f__categ_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

## Value

tbl. The input data frame with the summary score appended as a new
column.
