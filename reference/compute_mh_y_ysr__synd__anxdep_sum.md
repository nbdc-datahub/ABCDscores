# Compute "Youth Self Report \[Youth\] (Syndrome Scale - Anxious/Depressed): Sum"

Computes the summary score `mh_y_ysr__synd__anxdep_sum` Youth Self
Report \[Youth\] (Syndrome Scale - Anxious/Depressed): Sum

- *Summarized variables:*

  - `mh_y_ysr__anxdep__dep_001`

  - `mh_y_ysr__anxdep__anx_001`

  - `mh_y_ysr__anxdep__anx_002`

  - `mh_y_ysr__anxdep__anx_003`

  - `mh_y_ysr__anxdep_001`

  - `mh_y_ysr__anxdep_002`

  - `mh_y_ysr__anxdep__dep_002`

  - `mh_y_ysr__anxdep__anx_004`

  - `mh_y_ysr__anxdep__anx_005`

  - `mh_y_ysr__anxdep__dep_003`

  - `mh_y_ysr__anxdep__anx_006`

  - `mh_y_ysr__anxdep__dep_004`

  - `mh_y_ysr__anxdep__anx_007`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 13 items missing

## Usage

``` r
compute_mh_y_ysr__synd__anxdep_sum(
  data,
  name = "mh_y_ysr__synd__anxdep_sum",
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

[`compute_mh_y_ysr__synd__anxdep_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_ysr__synd__anxdep_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_ysr__synd__anxdep_sum(data) |>
  select(
    any_of(c("mh_y_ysr__synd__anxdep_sum", vars_mh_y_ysr__synd__anxdep))
  )
} # }
```
