# Compute "Prodromal Psychosis Scale \[Youth\] (Severity Score)"

Computes the summary score `mh_y_pps__severity_score` Prodromal
Psychosis Scale \[Youth\] (Severity Score)

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

- *Validation criterion:* none of 21 items missing

## Usage

``` r
compute_mh_y_pps__severity_score(
  data,
  name = "mh_y_pps__severity_score",
  max_na = 0,
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Details

The severity score is calculated by summing the severity scores for each
question and adding the number of `mh_y_pps__bother__yes_count` to the
total.

However, if the `mh_y_pps__severity_nm` score is greater than `max_na`,
the severity score is set to `NA`.

There is also a sanity check for the gating question of PPS base/bother
score. If the paired base/bother question is 0 or `NA` and the severity
score is not missing, the paired severity score is set to `NA` before
computing the score.

## See also

[`compute_mh_y_pps__bother__yes_count()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pps__bother__yes_count.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pps__severity_score(data) |>
  select(
    any_of(c("mh_y_pps__severity_score", vars_mh_y_pps__severity))
  ) |>
  View()
} # }
```
