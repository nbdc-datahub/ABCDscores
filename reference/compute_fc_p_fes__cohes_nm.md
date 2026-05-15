# Compute "Family Environment Scale \[Parent\] (Cohesion): Number missing"

Computes the summary score `fc_p_fes__cohes_nm` (Family Environment
Scale \[Parent\] (Cohesion): Number missing)

- *Summarized variables:*

  - `fc_p_fes__cohes_001`

  - `fc_p_fes__cohes_002`

  - `fc_p_fes__cohes_003`

  - `fc_p_fes__cohes_004`

  - `fc_p_fes__cohes_005`

  - `fc_p_fes__cohes_006`

  - `fc_p_fes__cohes_007`

  - `fc_p_fes__cohes_008`

  - `fc_p_fes__cohes_009`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_fc_p_fes__cohes_nm(
  data,
  name = "fc_p_fes__cohes_nm",
  exclude = c("777", "999"),
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

[`compute_fc_p_fes__cohes_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_fes__cohes_mean.md)
