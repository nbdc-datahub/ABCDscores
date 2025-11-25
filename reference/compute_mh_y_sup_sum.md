# Compute "7-Up Mania Inventory \[Youth\]: Sum"

Computes the summary score `mh_y_sup_sum` 7-Up Mania Inventory
\[Youth\]: Sum

- *Summarized variables:*

  - `mh_y_sup_001`

  - `mh_y_sup_002`

  - `mh_y_sup_003`

  - `mh_y_sup_004`

  - `mh_y_sup_005`

  - `mh_y_sup_006`

  - `mh_y_sup_007`

- *Excluded values:* none

- *Validation criterion:* none of 7 items missing

## Usage

``` r
compute_mh_y_sup_sum(
  data,
  name = "mh_y_sup_sum",
  max_na = 0,
  exclude = NULL,
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

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_sup_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_sup_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_sup_sum(data) |>
  select(
    any_of(c("mh_y_sup_sum", vars_mh_y_sup))
  )
} # }
```
