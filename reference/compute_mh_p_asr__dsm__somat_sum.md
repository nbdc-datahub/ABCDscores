# Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - Somatic complaints): Sum"

Computes the summary score `mh_p_asr__dsm__somat_sum` Adult Self Report
\[Parent\] (DSM-5 Oriented Scale - Somatic complaints): Sum

- *Summarized variables:*

  - `mh_p_asr__som__somat_001`

  - `mh_p_asr__som__somat_002`

  - `mh_p_asr__som__somat_003`

  - `mh_p_asr__som__somat_004`

  - `mh_p_asr__som__somat_005`

  - `mh_p_asr__som__somat_006`

  - `mh_p_asr__som__somat_007`

  - `mh_p_asr__som__somat_008`

  - `mh_p_asr__som__somat_009`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 9 items missing

## Usage

``` r
compute_mh_p_asr__dsm__somat_sum(
  data,
  name = "mh_p_asr__dsm__somat_sum",
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

[`compute_mh_p_asr__dsm__somat_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__dsm__somat_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__dsm__somat_sum(data) |>
  select(
    any_of(c("mh_p_asr__dsm__somat_sum", vars_mh_p_asr__dsm__somat))
  )
} # }
```
