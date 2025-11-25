# Compute "Adult Self Report \[Parent\] (Adaptive Functioning Scale - Personal strength): Number missing"

Computes the summary score `mh_p_asr__afs__strng_nm` Adult Self Report
\[Parent\] (Adaptive Functioning Scale - Personal strength): Number
missing

- *Summarized variables:*

  - `mh_p_asr__strng_001`

  - `mh_p_asr__strng_002`

  - `mh_p_asr__strng_003`

  - `mh_p_asr__strng_004`

  - `mh_p_asr__strng_005`

  - `mh_p_asr__strng_006`

  - `mh_p_asr__strng_007`

  - `mh_p_asr__strng_008`

  - `mh_p_asr__strng_009`

  - `mh_p_asr__strng_010`

  - `mh_p_asr__strng_011`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_asr__afs__strng

compute_mh_p_asr__afs__strng_nm(
  data,
  name = "mh_p_asr__afs__strng_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__afs__strng` is vector of all column names used to
compute summary score of `mh_p_asr__afs__strng` scores.

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
compute_mh_p_asr__afs__strng_nm(data) |>
  select(
    any_of(c("mh_p_asr__afs__strng_nm", vars_mh_p_asr__afs__strng))
  )
} # }
```
