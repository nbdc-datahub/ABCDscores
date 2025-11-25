# Compute "Adult Self Report \[Parent\] (Syndrome Scale - Thought problems): Number missing"

Computes the summary score `mh_p_asr__synd__tho_nm` Adult Self Report
\[Parent\] (Syndrome Scale - Thought problems): Number missing

- *Summarized variables:*

  - `mh_p_asr__tho_001`

  - `mh_p_asr__tho_002`

  - `mh_p_asr__tho_003`

  - `mh_p_asr__tho_004`

  - `mh_p_asr__tho_005`

  - `mh_p_asr__tho_006`

  - `mh_p_asr__tho_007`

  - `mh_p_asr__tho_008`

  - `mh_p_asr__tho__hypimp_001`

  - `mh_p_asr__tho__dep_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_asr__synd__tho

compute_mh_p_asr__synd__tho_nm(
  data,
  name = "mh_p_asr__synd__tho_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__synd__tho` is vector of all column names used to compute
summary score of `mh_p_asr__synd__tho` scores.

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
compute_mh_p_asr__synd__tho_nm(data) |>
  select(
    any_of(c("mh_p_asr__synd__tho_nm", vars_mh_p_asr__synd__tho))
  )
} # }
```
