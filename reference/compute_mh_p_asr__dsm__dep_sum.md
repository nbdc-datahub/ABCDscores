# Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Depresssive problems): Sum"

Computes the summary score `mh_p_asr__dsm__dep_sum` Adult Self Report
\[Parent\] (DSM-5 Oriented Scale - Depresssive problems): Sum

- *Summarized variables:*

  - `mh_p_asr__anxdep__dep_001`

  - `mh_p_asr__anxdep__dep_002`

  - `mh_p_asr__anxdep__dep_003`

  - `mh_p_asr__anxdep__dep_004`

  - `mh_p_asr__anxdep__dep_005`

  - `mh_p_asr__anxdep__dep_006`

  - `mh_p_asr__attn__dep_001`

  - `mh_p_asr__attn__dep_002`

  - `mh_p_asr__othpr__dep_001`

  - `mh_p_asr__othpr__dep_002`

  - `mh_p_asr__som__dep_001`

  - `mh_p_asr__som__dep_002`

  - `mh_p_asr__tho__dep_001`

  - `mh_p_asr__wthdr__dep_001`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 14 items missing

## Usage

``` r
compute_mh_p_asr__dsm__dep_sum(
  data,
  name = "mh_p_asr__dsm__dep_sum",
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

[`compute_mh_p_asr__dsm__dep_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__dsm__dep_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__dsm__dep_sum(data) |>
  select(
    any_of(c("mh_p_asr__dsm__dep_sum", vars_mh_p_asr__dsm__dep))
  )
} # }
```
