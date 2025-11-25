# Compute "Short Social Responsiveness Scale \[Parent\]: Number missing"

Computes the summary score `mh_p_ssrs_nm` Short Social Responsiveness
Scale \[Parent\]: Number missing

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

## Usage

``` r
vars_mh_p_ssrs

compute_mh_p_ssrs_nm(
  data,
  name = "mh_p_ssrs_nm",
  exclude = NULL,
  combine = TRUE
)
```

## Format

`vars_mh_p_ssrs` is vector of all column names used to compute summary
score of `mh_p_ssrs` scores.

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

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_ssrs_nm(data) |>
  select(
    any_of(c("mh_p_ssrs_nm", vars_mh_p_ssrs))
  )
} # }
```
