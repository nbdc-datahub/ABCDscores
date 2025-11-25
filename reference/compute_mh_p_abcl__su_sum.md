# Compute "Adult Behavior Checklist \[Parent\] (Substance use): Sum"

Computes the summary score `mh_p_abcl__su_sum` Adult Behavior Checklist
\[Parent\] (Substance use): Sum

- *Summarized variables:*

  - `mh_p_abcl__drg_001`

  - `mh_p_abcl__drunk_001`

  - `mh_p_abcl__nic_001`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 3 items missing

## Usage

``` r
compute_mh_p_abcl__su_sum(
  data,
  name = "mh_p_abcl__su_sum",
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

[`compute_mh_p_abcl__su_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_abcl__su_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__su_sum(data) |>
  select(
    any_of(c("mh_p_abcl__su_sum", vars_mh_p_abcl__su))
  )
} # }
```
