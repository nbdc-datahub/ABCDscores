# Compute "Values Scale \[Youth\] (Religion): Number missing"

Computes the summary score `fc_y_vs__relig_nm` (Values Scale \[Youth\]
(Religion): Number missing)

- *Summarized variables:*

  - `fc_y_vs__relig_001`

  - `fc_y_vs__relig_002`

  - `fc_y_vs__relig_003`

  - `fc_y_vs__relig_004`

  - `fc_y_vs__relig_005`

  - `fc_y_vs__relig_006`

  - `fc_y_vs__relig_007`

- *Excluded values:* none

## Usage

``` r
compute_fc_y_vs__relig_nm(data, name = "fc_y_vs__relig_nm", combine = TRUE)
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

[`compute_fc_y_vs__relig_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_y_vs__relig_mean.md)
