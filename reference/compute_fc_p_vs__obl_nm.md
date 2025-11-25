# Compute "Values Scale \[Parent\] (Family obligation): Number missing"

Computes the summary score `fc_p_vs__obl_nm` (Values Scale \[Parent\]
(Family obligation): Number missing)

- *Summarized variables:*

  - `fc_p_vs__obl_001`

  - `fc_p_vs__obl_002`

  - `fc_p_vs__obl_003`

  - `fc_p_vs__obl_004`

  - `fc_p_vs__obl_005`

- *Excluded values:* none

## Usage

``` r
compute_fc_p_vs__obl_nm(data, name = "fc_p_vs__obl_nm", combine = TRUE)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_fc_p_vs__obl_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_vs__obl_mean.md)
