# Compute "Prodromal Psychosis Scale \[Youth\] (Bother "No" responses): Count"

Computes the summary score `mh_y_pps__bother__no_count` Prodromal
Psychosis Scale \[Youth\] (Bother

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

- *Excluded values:* none

- *Validation criterion:* 0 of 21 items missing

## Usage

``` r
compute_mh_y_pps__bother__no_count(
  data,
  name = "mh_y_pps__bother__no_count",
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

The bother count is depend on the `mh_y_pps__bother_nm` score. If the
`mh_y_pps__bother_nm` score is greater than `max_na`, the bother count
is set to `NA`.

There is also a sanity check for the gating question in PPS bother
score. If the paired gating question is 0 or `NA` and the bother score
is not missing, the paired bother score is set to `NA` before computing
the count.

## See also

[`compute_mh_y_pps__bother_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__bother_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps__bother__no_count(data) |>
  select(
    any_of(c("mh_y_pps__bother__no_count", vars_mh_y_pps__bother))
  )
} # }
```
