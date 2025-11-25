# Compute "Prodromal Psychosis Scale \[Youth\] (number of "Yes" responses): Count "

Computes the summary score `mh_y_pps_count` Prodromal Psychosis Scale
\[Youth\] (number of

- *Summarized variables:*

  - `mh_y_pps_001`

  - `mh_y_pps_002`

  - `mh_y_pps_003`

  - `mh_y_pps_004`

  - `mh_y_pps_005`

  - `mh_y_pps_006`

  - `mh_y_pps_007`

  - `mh_y_pps_008`

  - `mh_y_pps_009`

  - `mh_y_pps_010`

  - `mh_y_pps_011`

  - `mh_y_pps_012`

  - `mh_y_pps_013`

  - `mh_y_pps_014`

  - `mh_y_pps_015`

  - `mh_y_pps_016`

  - `mh_y_pps_017`

  - `mh_y_pps_018`

  - `mh_y_pps_019`

  - `mh_y_pps_020`

  - `mh_y_pps_021`

- *Excluded values:* none

- *Validation criterion:* maximally 4 of 21 items missing

## Usage

``` r
vars_mh_y_pps_count

compute_mh_y_pps_count(
  data,
  name = "mh_y_pps_count",
  max_na = 4,
  combine = TRUE
)
```

## Format

vars_mh_y_pps_count is a character vector of all column names used to
compute summary score of `mh_y_pps_count` and `mh_y_pps_nm`

## Arguments

- data:

  tbl, Dataframe containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- max_na:

  integer, Maximum number of missing values allowed in the summary
  score.

- combine:

  logical, If `TRUE`, the summary score will be appended to the input
  data frame. If `FALSE`, the summary score will be returned as a
  separate data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.

## Details

The `mh_y_pps_count` is calculated by summing the number of `1`s in each
question. If the number of missing values is greater than `max_na`, the
summary score is set to `NA`. By default, `max_na` is set to 4 (20%).

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps_count(data) |>
  select(
    any_of(c("mh_y_pps_count", vars_mh_y_pps_count))
  )
} # }
```
