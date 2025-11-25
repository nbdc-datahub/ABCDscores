# Compute "Youth Self Report \[Youth\] (Syndrome Scale -Social problems): Sum"

Computes the summary score `mh_y_ysr__synd__soc_sum` Youth Self Report
\[Youth\] (Syndrome Scale -Social problems): Sum

- *Summarized variables:*

  - `mh_y_ysr__soc__anx_001`

  - `mh_y_ysr__soc_001`

  - `mh_y_ysr__soc_002`

  - `mh_y_ysr__soc_003`

  - `mh_y_ysr__soc_004`

  - `mh_y_ysr__soc_005`

  - `mh_y_ysr__soc_006`

  - `mh_y_ysr__soc_007`

  - `mh_y_ysr__soc_008`

  - `mh_y_ysr__soc_009`

  - `mh_y_ysr__soc_010`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 11 items missing

## Usage

``` r
compute_mh_y_ysr__synd__soc_sum(
  data,
  name = "mh_y_ysr__synd__soc_sum",
  max_na = 0,
  exclude = c("777", "999"),
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

- exclude:

  character vector. Values to be excluded from the summary score.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_ysr__synd__soc_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__synd__soc_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__synd__soc_sum(data) |>
  select(
    any_of(c("mh_y_ysr__synd__soc_sum", vars_mh_y_ysr__synd__soc))
  )
} # }
```
