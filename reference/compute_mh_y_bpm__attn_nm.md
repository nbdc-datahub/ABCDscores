# Compute "Brief Problem Monitor \[Youth\] (Attention): Number missing"

Computes the summary score `mh_y_bpm__attn_nm` Brief Problem Monitor
\[Youth\] (Attention): Number missing

- *Summarized variables:*

  - `mh_y_bpm__attn_001`

  - `mh_y_bpm__attn_002`

  - `mh_y_bpm__attn_003`

  - `mh_y_bpm__attn_004`

  - `mh_y_bpm__attn_005`

  - `mh_y_bpm__attn_006`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_y_bpm__attn

compute_mh_y_bpm__attn_nm(
  data,
  name = "mh_y_bpm__attn_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_y_bpm__attn` is vector of all column names used to compute
summary score of `mh_y_bpm__attn` scores.

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
compute_mh_y_bpm__attn_nm(data) |>
  select(
    any_of(c("mh_y_bpm__attn_nm", vars_mh_y_bpm__attn))
  )
} # }
```
