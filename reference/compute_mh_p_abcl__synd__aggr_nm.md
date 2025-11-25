# Compute "Adult Behavior Checklist \[Parent\] (Syndrome Scale - Aggressive behavior): Number missing"

Computes the summary score `mh_p_abcl__synd__aggr_nm` Adult Behavior
Checklist \[Parent\] (Syndrome Scale - Aggressive behavior): Number
missing

- *Summarized variables:*

  - `mh_p_abcl__aggr_001`

  - `mh_p_abcl__aggr_002`

  - `mh_p_abcl__aggr_003`

  - `mh_p_abcl__aggr_004`

  - `mh_p_abcl__aggr_005`

  - `mh_p_abcl__aggr_006`

  - `mh_p_abcl__aggr_007`

  - `mh_p_abcl__aggr__adhd_001`

  - `mh_p_abcl__aggr__antsoc_001`

  - `mh_p_abcl__aggr__antsoc_002`

  - `mh_p_abcl__aggr__antsoc_003`

  - `mh_p_abcl__aggr__antsoc_004`

  - `mh_p_abcl__aggr__antsoc_005`

  - `mh_p_abcl__aggr__antsoc_006`

  - `mh_p_abcl__aggr__antsoc_007`

  - `mh_p_abcl__aggr__antsoc_008`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_abcl__synd__aggr

compute_mh_p_abcl__synd__aggr_nm(
  data,
  name = "mh_p_abcl__synd__aggr_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_abcl__synd__aggr` is vector of all column names used to
compute summary score of `mh_p_abcl__synd__aggr` scores.

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
compute_mh_p_abcl__synd__aggr_nm(data) |>
  select(
    any_of(c("mh_p_abcl__synd__aggr_nm", vars_mh_p_abcl__synd__aggr))
  )
} # }
```
