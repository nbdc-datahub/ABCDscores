# Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize): Mean"

Computes the summary score `mh_p_ders__catast_mean` Difficulties in
Emotion Regulation Scale \[Parent\] (Catastrophize): Mean

- *Summarized variables:*

  - `mh_p_ders__catast_001`

  - `mh_p_ders__catast_002`

  - `mh_p_ders__catast_003`

  - `mh_p_ders__catast_004`

  - `mh_p_ders__catast_005`

  - `mh_p_ders__catast_006`

  - `mh_p_ders__catast_007`

  - `mh_p_ders__catast_008`

  - `mh_p_ders__catast_009`

  - `mh_p_ders__catast_010`

  - `mh_p_ders__catast_011`

  - `mh_p_ders__catast_012`

- *Excluded values:*

  - 999

  - 777

- *Validation criterion:* maximally 2 of 12 items missing

## Usage

``` r
vars_mh_p_ders__catast

compute_mh_p_ders__catast_mean(
  data,
  name = "mh_p_ders__catast_mean",
  max_na = 2,
  exclude = c("999", "777"),
  combine = TRUE
)
```

## Format

`vars_mh_p_ders__catast` is vector of all column names used to compute
summary score of `mh_p_ders__catast` scores.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_ders__catast_mean(data) |>
  select(
    any_of(c("mh_p_ders__catast_mean", vars_mh_p_ders__catast))
  )
} # }
```
