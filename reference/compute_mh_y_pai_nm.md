# Compute "NIH Toolbox - Positive Affect Items \[Youth\] (NA): Number missing"

Computes the summary score `mh_y_pai_nm` NIH Toolbox - Positive Affect
Items \[Youth\] (NA): Number missing

- *Summarized variables:*

  - `mh_y_pai_001`

  - `mh_y_pai_002`

  - `mh_y_pai_003`

  - `mh_y_pai_004`

  - `mh_y_pai_005`

  - `mh_y_pai_006`

  - `mh_y_pai_007`

  - `mh_y_pai_008`

  - `mh_y_pai_009`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_y_pai

compute_mh_y_pai_nm(
  data,
  name = "mh_y_pai_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_y_pai` is vector of all column names used to compute summary
score of `compute_mh_y_pai` scores.

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
compute_mh_y_pai_nm(data) |>
  select(
    any_of(c("mh_y_pai_nm", vars_mh_y_pai))
  )
} # }
```
