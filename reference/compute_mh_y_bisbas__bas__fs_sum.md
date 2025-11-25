# Compute "The Behavioral Inhibition System/Behavioral Activation System Scales \[Youth\] (BAS Fun Seeking): Sum"

Computes the summary score `mh_y_bisbas__bas__fs_sum` The Behavioral
Inhibition System/Behavioral Activation System Scales \[Youth\] (BAS Fun
Seeking): Sum

- *Summarized variables:*

  - `mh_y_bisbas__bas__fs_001`

  - `mh_y_bisbas__bas__fs_002`

  - `mh_y_bisbas__bas__fs_003`

  - `mh_y_bisbas__bas__fs_004`

- *Excluded values:* none

- *Validation criterion:* none of 4 items missing

## Usage

``` r
compute_mh_y_bisbas__bas__fs_sum(
  data,
  name = "mh_y_bisbas__bas__fs_sum",
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

[`compute_mh_y_bisbas__bas__fs_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_y_bisbas__bas__fs_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_y_bisbas__bas__fs_sum(data) |>
  select(
    any_of(c("mh_y_bisbas__bas__fs_sum", vars_mh_y_bisbas__bas__fs))
  )
} # }
```
