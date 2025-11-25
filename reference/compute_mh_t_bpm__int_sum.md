# Compute "Brief Problem Monitor \[Teacher\] (Internalizing): Sum"

Computes the summary score `mh_t_bpm__int_sum` Brief Problem Monitor
\[Teacher\] (Internalizing): Sum

- *Summarized variables:*

  - `mh_t_bpm__int_001`

  - `mh_t_bpm__int_002`

  - `mh_t_bpm__int_003`

  - `mh_t_bpm__int_004`

  - `mh_t_bpm__int_005`

  - `mh_t_bpm__int_006`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 6 items missing

## Usage

``` r
compute_mh_t_bpm__int_sum(
  data,
  name = "mh_t_bpm__int_sum",
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

[`compute_mh_t_bpm__int_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_t_bpm__int_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_t_bpm__int_sum(data) |>
  select(
    any_of(c("mh_t_bpm__int_sum", vars_mh_t_bpm__int))
  )
} # }
```
