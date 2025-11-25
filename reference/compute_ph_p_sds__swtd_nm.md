# Compute "Sleep Disturbance Scale \[Parent\] (Sleep-wake transition disorders) - Number missing"

Computes the summary score `ph_p_sds__swtd_nm` Sleep Disturbance Scale
\[Parent\] (Sleep-wake transition disorders) - Number missing

- *Summarized variables:*

  - `ph_p_sds__swtd_001`

  - `ph_p_sds__swtd_002`

  - `ph_p_sds__swtd_003`

  - `ph_p_sds__swtd_004`

  - `ph_p_sds__swtd_005`

  - `ph_p_sds__swtd_006`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_ph_p_sds__swtd_nm(
  data,
  name = "ph_p_sds__swtd_nm",
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

[`compute_ph_p_sds__swtd_sum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_ph_p_sds__swtd_sum.md)
