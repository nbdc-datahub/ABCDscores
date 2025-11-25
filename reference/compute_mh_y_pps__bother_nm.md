# Compute "Prodromal Psychosis Scale \[Youth\] (Bother responses): Number missing"

Computes the summary score `mh_y_pps__bother_nm` Prodromal Psychosis
Scale \[Youth\] (Bother responses): Number missing

- *Summarized variables:*

  - `mh_y_pps__bother_001`

  - `mh_y_pps__bother_002`

  - `mh_y_pps__bother_003`

  - `mh_y_pps__bother_004`

  - `mh_y_pps__bother_005`

  - `mh_y_pps__bother_006`

  - `mh_y_pps__bother_007`

  - `mh_y_pps__bother_008`

  - `mh_y_pps__bother_009`

  - `mh_y_pps__bother_010`

  - `mh_y_pps__bother_011`

  - `mh_y_pps__bother_012`

  - `mh_y_pps__bother_013`

  - `mh_y_pps__bother_014`

  - `mh_y_pps__bother_015`

  - `mh_y_pps__bother_016`

  - `mh_y_pps__bother_017`

  - `mh_y_pps__bother_018`

  - `mh_y_pps__bother_019`

  - `mh_y_pps__bother_020`

  - `mh_y_pps__bother_021`

## Usage

``` r
vars_mh_y_pps__bother

compute_mh_y_pps__bother_nm(data, name = "mh_y_pps__bother_nm", combine = TRUE)
```

## Format

vars_mh_y_pps\_\_bother is a character vector of all column names used
to compute summary of `mh_y_pps__bother` scores.

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

The number of missing values in the `mh_y_pps__bother` score is
calculated by subtracting the number of valid pairs from the total PPS
count for each subject (mh_y_pps_count - bother_pair_good_sum).

A good pair is defined as a pair where the `mh_y_pps_count` is 1 and the
`mh_y_pps__bother` is not missing.

## See also

[`compute_mh_y_pps_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps_count.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps__bother_nm(data) |>
  select(
    any_of(c("mh_y_pps__bother_nm", vars_mh_y_pps__bother))
  )
} # }
```
