# Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Catastrophize): Number missing"

Computes the summary score `mh_p_ders__catast_nm` Difficulties in
Emotion Regulation Scale \[Parent\] (Catastrophize): Number missing

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

## Usage

``` r
compute_mh_p_ders__catast_nm(
  data,
  name = "mh_p_ders__catast_nm",
  exclude = c("999", "777"),
  combine = TRUE
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_p_ders__catast_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_ders__catast_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_ders__catast_nm(data) |>
  select(
    any_of(c("mh_p_ders__catast_nm", vars_mh_p_ders__catast))
  )
} # }
```
