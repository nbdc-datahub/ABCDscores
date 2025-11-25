# Compute "NIH Toolbox - Positive Affect Items \[Youth\] (NA): Sum \[Validation: None missing or declined\]"

Computes the summary score `mh_y_pai_sum` NIH Toolbox - Positive Affect
Items \[Youth\] (NA): Sum \[Validation: None missing or declined\]

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

- *Validation criterion:* none of 9 items missing

## Usage

``` r
compute_mh_y_pai_sum(
  data,
  name = "mh_y_pai_sum",
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

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## See also

[`compute_mh_y_pai_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_pai_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_pai_sum(data) |>
  select(
    any_of(c("mh_y_pai_sum", vars_mh_y_pai))
  )
} # }
```
