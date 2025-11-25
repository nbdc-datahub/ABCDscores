# Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Avoidant personality problems): Number missing"

Computes the summary score `mh_p_asr__dsm__avoid_nm` Adult Self Report
\[Parent\] (DSM-5 Oriented Scale - Avoidant personality problems):
Number missing

- *Summarized variables:*

  - `mh_p_asr__anxdep__avoid_001`

  - `mh_p_asr__anxdep__avoid_002`

  - `mh_p_asr__othpr__avoid_001`

  - `mh_p_asr__wthdr__avoid_001`

  - `mh_p_asr__wthdr__avoid_002`

  - `mh_p_asr__wthdr__avoid_003`

  - `mh_p_asr__wthdr__avoid_004`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_asr__dsm__avoid

compute_mh_p_asr__dsm__avoid_nm(
  data,
  name = "mh_p_asr__dsm__avoid_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__dsm__avoid` is vector of all column names used to
compute summary score of `mh_p_asr__dsm__avoid` scores.

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
compute_mh_p_asr__dsm__avoid_nm(data) |>
  select(
    any_of(c("mh_p_asr__dsm__avoid_nm", vars_mh_p_asr__dsm__avoid))
  )
} # }
```
