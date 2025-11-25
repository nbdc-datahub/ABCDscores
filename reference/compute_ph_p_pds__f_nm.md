# Compute "Pubertal Development Scale & Menstrual Cycle Survey History \[Parent\] (Female): Number missing"

Computes the summary score `ph_p_pds__f_nm` Pubertal Development Scale &
Menstrual Cycle Survey History \[Parent\] (Female): Number missing

- *Summarized variables:*

  - `ph_p_pds_001`

  - `ph_p_pds_002`

  - `ph_p_pds_003`

  - `ph_p_pds__f_001`

  - `ph_p_pds__f_002`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_ph_p_pds__f_nm(
  data,
  name = "ph_p_pds__f_nm",
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

[`compute_ph_p_pds__f_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_pds__f_mean.md)
