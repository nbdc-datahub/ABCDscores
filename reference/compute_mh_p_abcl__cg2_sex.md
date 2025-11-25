# Compute "Adult Behavior Checklist \[Parent\] Sex Assignment"

Computes the summary score `mh_p_abcl__cg2_sex` Adult Behavior Checklist
\[Parent\] Sex Assignment

- *Summarized variables:*

  - `mh_p_abcl__cg2_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_abcl__cg2

compute_mh_p_abcl__cg2_sex(data, name = "mh_p_abcl__cg2_sex", combine = TRUE)
```

## Format

`vars_mh_p_abcl__cg2` is vector of all column names used to compute
summary score of `mh_p_abcl__cg2` scores.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_abcl__cg2_sex(data) |>
  select(
    any_of(c("mh_p_abcl__cg2_sex", vars_mh_p_abcl__cg2))
  )
} # }
```
