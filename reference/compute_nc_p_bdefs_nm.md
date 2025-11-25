# Compute "Barkley Deficits in Executive Functioning Scale \[Parent\] (EF Summary Score): Number missing"

Computes the summary score `nc_p_bdefs_nm` Barkley Deficits in Executive
Functioning Scale \[Parent\] (EF Summary Score): Number missing

- *Summarized variables:*

  - `nc_p_bdefs_001`

  - `nc_p_bdefs_002`

  - `nc_p_bdefs_003`

  - `nc_p_bdefs_004`

  - `nc_p_bdefs_005`

  - `nc_p_bdefs_006`

  - `nc_p_bdefs_007`

  - `nc_p_bdefs_008`

  - `nc_p_bdefs_009`

  - `nc_p_bdefs_010`

  - `nc_p_bdefs_011`

  - `nc_p_bdefs_012`

  - `nc_p_bdefs_013`

  - `nc_p_bdefs_014`

  - `nc_p_bdefs_015`

  - `nc_p_bdefs_016`

  - `nc_p_bdefs_017`

  - `nc_p_bdefs_018`

  - `nc_p_bdefs_019`

  - `nc_p_bdefs_020`

## Usage

``` r
compute_nc_p_bdefs_nm(data, name = "nc_p_bdefs_nm", combine = TRUE)
```

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_nc_p_bdefs_sum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_nc_p_bdefs_sum.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_nc_p_bdefs_nm(data) |>
  select(
    data,
    all_of(c("nc_p_bdefs_nm", vars_nc_p_bdefs))
  )
} # }
```
