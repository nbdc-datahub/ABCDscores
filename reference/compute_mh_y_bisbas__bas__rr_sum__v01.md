# Compute "The Behavioral Inhibition System/Behavioral Activation System Scales \[Youth\] ((BAS Reward Responsiveness (modified)): Sum"

Computes the summary score `mh_y_bisbas__bas__rr_sum__v01` The
Behavioral Inhibition System/Behavioral Activation System Scales
\[Youth\] ((BAS Reward Responsiveness (modified)): Sum

- *Summarized variables:*

  - `mh_y_bisbas__bas__rr_001`

  - `mh_y_bisbas__bas__rr_002`

  - `mh_y_bisbas__bas__rr_004`

  - `mh_y_bisbas__bas__rr_005`

- *Excluded values:* none

- *Validation criterion:* none of 4 items missing

## Usage

``` r
compute_mh_y_bisbas__bas__rr_sum__v01(
  data,
  name = "mh_y_bisbas__bas__rr_sum__v01",
  max_na = 0,
  exclude = NULL,
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

[`compute_mh_y_bisbas__bas__rr_nm__v01()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_bisbas__bas__rr_nm__v01.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_bisbas__bas__rr_sum__v01(data) |>
  select(
    any_of(c("mh_y_bisbas__bas__rr_sum__v01", vars_mh_y_bisbas__bas__rr__v01))
  )
} # }
```
