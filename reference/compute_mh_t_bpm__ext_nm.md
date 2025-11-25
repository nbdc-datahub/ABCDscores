# Compute "Brief Problem Monitor \[Teacher\] (Externalizing): Number missing"

Computes the summary score `mh_t_bpm__ext_nm` Brief Problem Monitor
\[Teacher\] (Externalizing): Number missing

- *Summarized variables:*

  - `mh_t_bpm__ext_001`

  - `mh_t_bpm__ext_002`

  - `mh_t_bpm__ext_003`

  - `mh_t_bpm__ext_004`

  - `mh_t_bpm__ext_005`

  - `mh_t_bpm__ext_006`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_t_bpm__ext

compute_mh_t_bpm__ext_nm(
  data,
  name = "mh_t_bpm__ext_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_t_bpm__ext` is vector of all column names used to compute
summary score of `mh_t_bpm__ext` scores.

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
compute_mh_t_bpm__ext_nm(data) |>
  select(
    any_of(c("mh_t_bpm__ext_nm", vars_mh_t_bpm__ext))
  )
} # }
```
