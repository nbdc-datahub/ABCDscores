# Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score): Mean"

Computes the summary score `mh_y_pps__severity_mean` Prodromal Psychosis
Scale \[Youth\] (Severity Score): Mean

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

  - `mh_y_pps__severity_001`

  - `mh_y_pps__severity_002`

  - `mh_y_pps__severity_003`

  - `mh_y_pps__severity_004`

  - `mh_y_pps__severity_005`

  - `mh_y_pps__severity_006`

  - `mh_y_pps__severity_007`

  - `mh_y_pps__severity_008`

  - `mh_y_pps__severity_009`

  - `mh_y_pps__severity_010`

  - `mh_y_pps__severity_011`

  - `mh_y_pps__severity_012`

  - `mh_y_pps__severity_013`

  - `mh_y_pps__severity_014`

  - `mh_y_pps__severity_015`

  - `mh_y_pps__severity_016`

  - `mh_y_pps__severity_017`

  - `mh_y_pps__severity_018`

  - `mh_y_pps__severity_019`

  - `mh_y_pps__severity_020`

  - `mh_y_pps__severity_021`

- *Excluded values:* none

- *Validation criterion:* none of 21 items missing

## Usage

``` r
compute_mh_y_pps__severity_mean(
  data,
  name = "mh_y_pps__severity_mean",
  max_na = 0,
  combine = TRUE
)
```

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

The mean severity score is calculated by dividing the total severity
score by the number of `mh_y_pps__bother__yes_count`. If any of the two
values is missing, the mean severity score is set to `NA`.

## See also

[`compute_mh_y_pps__bother__yes_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__bother__yes_count.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps__severity_mean(data) |>
  select(
    any_of(c("mh_y_pps__severity_mean", vars_mh_y_pps__severity))
  )
} # }
```
