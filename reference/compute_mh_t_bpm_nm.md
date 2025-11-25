# Compute "Brief Problem Monitor \[Teacher\]: Number missing"

Computes the summary score `mh_t_bpm_nm` Brief Problem Monitor
\[Teacher\]: Number missing

- *Summarized variables:*

  - `mh_t_bpm__attn_001`

  - `mh_t_bpm__attn_002`

  - `mh_t_bpm__attn_003`

  - `mh_t_bpm__attn_004`

  - `mh_t_bpm__attn_005`

  - `mh_t_bpm__attn_006`

  - `mh_t_bpm__ext_001`

  - `mh_t_bpm__ext_002`

  - `mh_t_bpm__ext_003`

  - `mh_t_bpm__ext_004`

  - `mh_t_bpm__ext_005`

  - `mh_t_bpm__ext_006`

  - `mh_t_bpm__int_001`

  - `mh_t_bpm__int_002`

  - `mh_t_bpm__int_003`

  - `mh_t_bpm__int_004`

  - `mh_t_bpm__int_005`

  - `mh_t_bpm__int_006`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_t_bpm

compute_mh_t_bpm_nm(
  data,
  name = "mh_t_bpm_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_t_bpm` is vector of all column names used to compute summary
score of `mh_t_bpm` scores.

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
compute_mh_t_bpm_nm(data) |>
  select(
    any_of(c("mh_t_bpm_nm", vars_mh_t_bpm))
  )
} # }
```
