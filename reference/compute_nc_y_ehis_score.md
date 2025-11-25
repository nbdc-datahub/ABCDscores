# Compute "Edinburgh Handedness Inventory \[Youth\] (Handedness score rating)"

Computes the summary score `nc_y_ehis_score` Edinburgh Handedness
Inventory \[Youth\] (Handedness score rating)

- *Summarized variables:*

  - `nc_y_ehis_001`

  - `nc_y_ehis_002`

  - `nc_y_ehis_003`

  - `nc_y_ehis_004`

## Usage

``` r
vars_nc_y_ehis

compute_nc_y_ehis_score(
  data,
  name = "nc_y_ehis_score",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_nc_y_ehis is a character vector of all column names used to compute
summary scores of `nc_y_ehis`.

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- max_na:

  integer, Maximum number of missing values allowed in the summary
  score. `NULL` means no limit.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_nc_y_ehis_score(data) |>
  select(
    data,
    all_of(c("nc_y_ehis_score", vars_nc_y_ehis))
  )
} # }
```
