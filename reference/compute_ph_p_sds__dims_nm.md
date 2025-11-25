# Compute "Sleep Disturbance Scale \[Parent\] (Disorders of initiating and maintaining sleep) - Number missing"

Computes the summary score `ph_p_sds__dims_nm` Sleep Disturbance Scale
\[Parent\] (Disorders of initiating and maintaining sleep) - Number
missing

- *Summarized variables:*

  - `ph_p_sds__dims_001`

  - `ph_p_sds__dims_002`

  - `ph_p_sds__dims_003`

  - `ph_p_sds__dims_004`

  - `ph_p_sds__dims_005`

  - `ph_p_sds__dims_006`

  - `ph_p_sds__dims_007`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_ph_p_sds__dims_nm(
  data,
  name = "ph_p_sds__dims_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- exclude:

  character, Values to be excluded from the summary score.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_ph_p_sds__dims_sum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_sds__dims_sum.md)
