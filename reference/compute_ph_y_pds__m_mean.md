# Compute "Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\] (Male): Mean"

Computes the summary score `ph_y_pds__m_mean` Pubertal Development Scale
& Menstrual Cycle Survey History \[Youth\] (Male): Mean \[Validation: No
more than 1 missing or declined\]

- *Summarized variables:*

  - `ph_y_pds_001`

  - `ph_y_pds_002`

  - `ph_y_pds_003`

  - `ph_y_pds__m_001`

  - `ph_y_pds__m_002`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 item missing

## Usage

``` r
vars_ph_y_pds__m

compute_ph_y_pds__m_mean(
  data,
  name = "ph_y_pds__m_mean",
  combine = TRUE,
  exclude = c("777", "999"),
  max_na = 1
)
```

## Format

vars_ph_y_pds\_\_m is a character vector of all column names used to
compute summary score of `ph_y_pds__m_mean` and `ph_y_pds__m_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

## Value

tbl. The input data frame with the summary score appended as a new
column.
