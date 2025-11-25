# Compute "Edinburgh Handedness Inventory \[Youth\]: Number missing"

Computes the summary score `nc_y_ehis_nm` Edinburgh Handedness Inventory
\[Youth\]: Number missing

- *Summarized variables:*

  - `nc_y_ehis_001`

  - `nc_y_ehis_002`

  - `nc_y_ehis_003`

  - `nc_y_ehis_004`

## Usage

``` r
compute_nc_y_ehis_nm(data, name = "nc_y_ehis_nm", combine = TRUE)
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

[`compute_nc_y_ehis_score()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_nc_y_ehis_score.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_nc_y_ehis_nm(data) |>
  select(
    data,
    all_of(c("nc_y_ehis_nm", vars_nc_y_ehis))
  )
} # }
```
