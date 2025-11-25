# Compute "Family Environment Scale \[Parent\] (Organization): Number missing"

Computes the summary score `fc_p_fes__org_nm` (Family Environment Scale
\[Parent\] (Organization): Number missing)

- *Summarized variables:*

  - `fc_p_fes__org_001`

  - `fc_p_fes__org_002`

  - `fc_p_fes__org_003`

  - `fc_p_fes__org_004`

  - `fc_p_fes__org_005`

  - `fc_p_fes__org_006`

  - `fc_p_fes__org_007`

  - `fc_p_fes__org_008`

  - `fc_p_fes__org_009`

- *Excluded values:* none

## Usage

``` r
compute_fc_p_fes__org_nm(data, name = "fc_p_fes__org_nm", combine = TRUE)
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

[`compute_fc_p_fes__org_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fc_p_fes__org_mean.md)
