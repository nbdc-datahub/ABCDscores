# Compute "Youth Self Report \[Youth\] (Positive): Number missing"

Computes the summary score `mh_y_ysr__pos_nm` Youth Self Report
\[Youth\] (Positive): Number missing

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

## Usage

``` r
vars_mh_y_ysr__pos

compute_mh_y_ysr__pos_nm(
  data,
  name = "mh_y_ysr__pos_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_y_ysr__pos` is vector of all column names used to compute
summary score of `mh_y_ysr__pos` scores.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__pos_nm(data) |>
  select(
    any_of(c("mh_y_ysr__pos_nm", vars_mh_y_ysr__pos))
  )
} # }
```
