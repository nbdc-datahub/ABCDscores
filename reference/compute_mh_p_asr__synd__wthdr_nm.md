# Compute "Adult Self Report \[Parent\] (Syndrome Scale - Withdrawn): Number missing"

Computes the summary score `mh_p_asr__synd__wthdr_nm` Adult Self Report
\[Parent\] (Syndrome Scale - Withdrawn): Number missing

- *Summarized variables:*

  - `mh_p_asr__wthdr_001`

  - `mh_p_asr__wthdr_002`

  - `mh_p_asr__wthdr_003`

  - `mh_p_asr__wthdr_004`

  - `mh_p_asr__wthdr__avoid_001`

  - `mh_p_asr__wthdr__avoid_002`

  - `mh_p_asr__wthdr__avoid_003`

  - `mh_p_asr__wthdr__avoid_004`

  - `mh_p_asr__wthdr__dep_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_asr__synd__wthdr

compute_mh_p_asr__synd__wthdr_nm(
  data,
  name = "mh_p_asr__synd__wthdr_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__synd__wthdr` is vector of all column names used to
compute summary score of `mh_p_asr__synd__wthdr` scores.

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
compute_mh_p_asr__synd__wthdr_nm(data) |>
  select(
    any_of(c("mh_p_asr__synd__wthdr_nm", vars_mh_p_asr__synd__wthdr))
  )
} # }
```
