# Compute "Barkley Deficits in Executive Functioning Scale \[Parent\] (EF Summary Score): Sum"

Computes the summary score `nc_p_bdefs_sum` Barkley Deficits in
Executive Functioning Scale \[Parent\] (EF Summary Score): Sum

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
vars_nc_p_bdefs

compute_nc_p_bdefs_sum(
  data,
  name = "nc_p_bdefs_sum",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_nc_p_bdefs is a character vector of all column names used to
compute summary scores of `nc_p_bdefs`.

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
compute_nc_p_bdefs_sum(data) |>
  select(
    data,
    all_of(c("nc_p_bdefs_sum", vars_nc_p_bdefs))
  )
} # }
```
