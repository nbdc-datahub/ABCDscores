# Compute "Adult Behavior Checklist \[Parent\] (Days drug use): Sum"

Computes the summary score `mh_p_abcl__su__drg_sum` Adult Behavior
Checklist \[Parent\] (Days drug use): Sum

- *Summarized variables:*

  - `mh_p_abcl__drg_001`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 1 items missing

## Usage

``` r
compute_mh_p_abcl__su__drg_sum(
  data,
  name = "mh_p_abcl__su__drg_sum",
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

[`compute_mh_p_abcl__su__drg_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_abcl__su__drg_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__su__drg_sum(data) |>
  select(
    any_of(c("mh_p_abcl__su__drg_sum", vars_mh_p_abcl__su__drg))
  )
} # }
```
