# Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Thought problems): Sum"

Computes the summary score `mh_p_cbcl__synd__tho_sum` Child Behavior
Checklist \[Parent\] (Syndrome Scale - Thought problems): Sum

- *Summarized variables:*

  - `mh_p_cbcl__tho_001`

  - `mh_p_cbcl__tho__dep_003`

  - `mh_p_cbcl__tho__dep_001`

  - `mh_p_cbcl__tho_002`

  - `mh_p_cbcl__tho_003`

  - `mh_p_cbcl__tho_004`

  - `mh_p_cbcl__tho_005`

  - `mh_p_cbcl__tho_006`

  - `mh_p_cbcl__tho_007`

  - `mh_p_cbcl__tho_008`

  - `mh_p_cbcl__tho__dep_002`

  - `mh_p_cbcl__tho_009`

  - `mh_p_cbcl__tho_010`

  - `mh_p_cbcl__tho_011`

  - `mh_p_cbcl__tho_012`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 15 items missing

## Usage

``` r
compute_mh_p_cbcl__synd__tho_sum(
  data,
  name = "mh_p_cbcl__synd__tho_sum",
  max_na = 1,
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

[`compute_mh_p_cbcl__synd__tho_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_cbcl__synd__tho_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_cbcl__synd__tho_sum(data) |>
  select(
    any_of(c("mh_p_cbcl__synd__tho_sum", vars_mh_p_cbcl__synd__tho))
  )
} # }
```
