# Compute "Short Social Responsiveness Scale \[Parent\]: Sum"

Computes the summary score `mh_p_ssrs_sum` Short Social Responsiveness
Scale \[Parent\]: Sum

- *Summarized variables:*

  - `mh_p_ssrs_001`

  - `mh_p_ssrs_002`

  - `mh_p_ssrs_003`

  - `mh_p_ssrs_004`

  - `mh_p_ssrs_005`

  - `mh_p_ssrs_006`

  - `mh_p_ssrs_007`

  - `mh_p_ssrs_008`

  - `mh_p_ssrs_009`

  - `mh_p_ssrs_010`

  - `mh_p_ssrs_011`

- *Excluded values:* none

- *Validation criterion:* none of 11 items missing

## Usage

``` r
compute_mh_p_ssrs_sum(
  data,
  name = "mh_p_ssrs_sum",
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

[`compute_mh_p_ssrs_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_ssrs_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_ssrs_sum(data) |>
  select(
    any_of(c("mh_p_ssrs_sum", vars_mh_p_ssrs))
  )
} # }
```
