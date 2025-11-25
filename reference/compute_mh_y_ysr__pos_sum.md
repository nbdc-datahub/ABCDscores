# Compute "Youth Self Report \[Youth\] (Positive): Sum"

Computes the summary score `mh_y_ysr__pos_sum` Youth Self Report
\[Youth\] (Positive): Sum

- *Summarized variables:*

  - `mh_y_ysr__pos_001`

  - `mh_y_ysr__pos_002`

  - `mh_y_ysr__pos_003`

  - `mh_y_ysr__pos_004`

  - `mh_y_ysr__pos_005`

  - `mh_y_ysr__pos_006`

  - `mh_y_ysr__pos_007`

  - `mh_y_ysr__pos_008`

  - `mh_y_ysr__pos_009`

  - `mh_y_ysr__pos_010`

  - `mh_y_ysr__pos_011`

  - `mh_y_ysr__pos_012`

  - `mh_y_ysr__pos_013`

  - `mh_y_ysr__pos_014`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 14 items missing

## Usage

``` r
compute_mh_y_ysr__pos_sum(
  data,
  name = "mh_y_ysr__pos_sum",
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

[`compute_mh_y_ysr__pos_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__pos_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__pos_sum(data) |>
  select(
    any_of(c("mh_y_ysr__pos_sum", vars_mh_y_ysr__pos))
  )
} # }
```
