# Compute "Peer Network Health \[Youth\]: Number missing"

Computes the summary score `fc_y_pnh_nm` (Peer Network Health \[Youth\]:
Number missing)

- *Summarized variables:*

  - `fc_y_pnh_001`

  - `fc_y_pnh_002`

  - `fc_y_pnh_002__01`

  - `fc_y_pnh_003`

  - `fc_y_pnh_003__01`

- *Excluded values:*

  - 777

## Usage

``` r
compute_fc_y_pnh_nm(
  data,
  name = "fc_y_pnh_nm",
  exclude = c("777"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_fc_y_pnh_sum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_y_pnh_sum.md)
