# Compute "Difficulties in Emotion Regulation Scale \[Parent\] (Attuned): Number missing"

Computes the summary score `mh_p_ders__attun_nm` Difficulties in Emotion
Regulation Scale \[Parent\] (Attuned): Number missing

- *Summarized variables:*

  - `mh_p_ders__attun_001`

  - `mh_p_ders__attun_002`

  - `mh_p_ders__attun_003`

  - `mh_p_ders__attun_004`

  - `mh_p_ders__attun_005`

  - `mh_p_ders__attun_006`

- *Excluded values:*

  - 999

  - 777

## Usage

``` r
compute_mh_p_ders__attun_nm(
  data,
  name = "mh_p_ders__attun_nm",
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

[`compute_mh_p_ders__attun_mean()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_ders__attun_mean.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_ders__attun_nm(data) |>
  select(
    any_of(c("mh_p_ders__attun_nm", vars_mh_p_ders__attun))
  )
} # }
```
