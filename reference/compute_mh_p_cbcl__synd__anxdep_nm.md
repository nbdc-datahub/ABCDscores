# Compute "Child Behavior Checklist \[Parent\] (Syndrome Scale - Anxious/Depressed): Number missing"

Computes the summary score `mh_p_cbcl__synd__anxdep_nm` Child Behavior
Checklist \[Parent\] (Syndrome Scale - Anxious/Depressed): Number
missing

- *Summarized variables:*

  - `mh_p_cbcl__anxdep__anx_007`

  - `mh_p_cbcl__anxdep__dep_001`

  - `mh_p_cbcl__anxdep__anx_001`

  - `mh_p_cbcl__anxdep__anx_002`

  - `mh_p_cbcl__anxdep__anx_003`

  - `mh_p_cbcl__anxdep_001`

  - `mh_p_cbcl__anxdep_002`

  - `mh_p_cbcl__anxdep__dep_002`

  - `mh_p_cbcl__anxdep__anx_004`

  - `mh_p_cbcl__anxdep__anx_005`

  - `mh_p_cbcl__anxdep__dep_003`

  - `mh_p_cbcl__anxdep__anx_006`

  - `mh_p_cbcl__anxdep__dep_004`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_cbcl__synd__anxdep

compute_mh_p_cbcl__synd__anxdep_nm(
  data,
  name = "mh_p_cbcl__synd__anxdep_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_cbcl__synd__anxdep` is vector of all column names used to
compute summary score of `mh_p_cbcl__synd__anxdep` scores.

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
compute_mh_p_cbcl__synd__anxdep_nm(data) |>
  select(
    any_of(c("mh_p_cbcl__synd__anxdep_nm", vars_mh_p_cbcl__synd__anxdep))
  )
} # }
```
