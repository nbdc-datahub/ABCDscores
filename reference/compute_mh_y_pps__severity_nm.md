# Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score): Number missing"

Computes the summary score `mh_y_pps__severity_nm` Prodromal Psychosis
Scale \[Youth\] (Severity Score): Number missing

- *Summarized variables:*

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

## Usage

``` r
vars_mh_y_pps__severity

compute_mh_y_pps__severity_nm(
  data,
  name = "mh_y_pps__severity_nm",
  combine = TRUE
)
```

## Format

vars_mh_y_pps\_\_severity is a character vector of all column names used
to compute summary of `mh_y_pps__severity` scores.

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

## Details

The number of missing values in the `mh_y_pps__severity` score is
calculated by subtracting the number of valid pairs from the total
**bother** count for each subject (mh_y_pps\_\_bother_yes_count -
severity_pair_good_sum).

A good pair is defined as a pair where the `mh_y_pps__bother__yes_count`
is 1 and the `mh_y_pps__severity` is not missing.

## See also

[`compute_mh_y_pps__bother__yes_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__bother__yes_count.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps__severity_nm(data) |>
  select(
    any_of(c("mh_y_pps__severity_nm", vars_mh_y_pps__severity))
  )
} # }
```
