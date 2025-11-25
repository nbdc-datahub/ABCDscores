# Compute "Adult Self Report \[Parent\] (Syndrome Scale - Attention problems): Sum"

Computes the summary score `mh_p_asr__synd__attn_sum` Adult Self Report
\[Parent\] (Syndrome Scale - Attention problems): Sum

- *Summarized variables:*

  - `mh_p_asr__attn_001`

  - `mh_p_asr__attn_002`

  - `mh_p_asr__attn_003`

  - `mh_p_asr__attn_004`

  - `mh_p_asr__attn_005`

  - `mh_p_asr__attn__inatt_001`

  - `mh_p_asr__attn__inatt_002`

  - `mh_p_asr__attn__inatt_003`

  - `mh_p_asr__attn__inatt_004`

  - `mh_p_asr__attn__inatt_005`

  - `mh_p_asr__attn__inatt_006`

  - `mh_p_asr__attn__inatt_007`

  - `mh_p_asr__attn__antsoc_001`

  - `mh_p_asr__attn__dep_001`

  - `mh_p_asr__attn__dep_002`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 15 items missing

## Usage

``` r
compute_mh_p_asr__synd__attn_sum(
  data,
  name = "mh_p_asr__synd__attn_sum",
  max_na = 1,
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

[`compute_mh_p_asr__synd__attn_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__synd__attn_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__synd__attn_sum(data) |>
  select(
    any_of(c("mh_p_asr__synd__attn_sum", vars_mh_p_asr__synd__attn))
  )
} # }
```
