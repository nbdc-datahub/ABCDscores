# Compute "Parent General Behavior Inventory \[Parent\]: Number missing"

Computes the summary score `mh_p_gbi_nm` Parent General Behavior
Inventory \[Parent\]: Number missing

- *Summarized variables:*

  - `mh_p_gbi_001`

  - `mh_p_gbi_002`

  - `mh_p_gbi_003`

  - `mh_p_gbi_004`

  - `mh_p_gbi_005`

  - `mh_p_gbi_006`

  - `mh_p_gbi_007`

  - `mh_p_gbi_008`

  - `mh_p_gbi_009`

  - `mh_p_gbi_010`

- *Excluded values:* none

## Usage

``` r
vars_mh_p_gbi

compute_mh_p_gbi_nm(data, name = "mh_p_gbi_nm", exclude = NULL, combine = TRUE)
```

## Format

`vars_mh_p_gbi` is vector of all column names used to compute summary
score of `mh_p_gbi` scores.

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
compute_mh_p_gbi_nm(data) |>
  select(
    any_of(c("mh_p_gbi_nm", vars_mh_p_gbi))
  )
} # }
```
