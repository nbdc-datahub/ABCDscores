# Compute "Pubertal Development Scale & Menstrual Cycle Survey History \[Youth\] (Male): Approximate tanner stages - Number missing"

Computes the summary score `ph_y_pds__m__categ_nm` Pubertal Development
Scale & Menstrual Cycle Survey History \[Youth\] (Male): Approximate
tanner stages - Number missing

- *Summarized variables:*

  - `ph_y_pds_002`

  - `ph_y_pds__m_001`

  - `ph_y_pds__m_002`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_ph_y_pds__m__categ_nm(
  data,
  name = "ph_y_pds__m__categ_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

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

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_ph_y_pds__m_categ()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_y_pds__m_categ.md)
