# Compute "Adult Self Report \[Parent\] (Critical Items): Number missing"

Computes the summary score `mh_p_asr__critic_nm` Adult Self Report
\[Parent\] (Critical Items): Number missing

- *Summarized variables:*

  - `mh_p_asr__aggr_001`

  - `mh_p_asr__aggr__antsoc_003`

  - `mh_p_asr__aggr__antsoc_006`

  - `mh_p_asr__aggr__antsoc_008`

  - `mh_p_asr__anxdep__dep_001`

  - `mh_p_asr__anxdep__dep_004`

  - `mh_p_asr__anxdep__dep_005`

  - `mh_p_asr__attn__inatt_002`

  - `mh_p_asr__othpr__hypimp_001`

  - `mh_p_asr__othpr__antsoc_001`

  - `mh_p_asr__rule_001`

  - `mh_p_asr__rule_003`

  - `mh_p_asr__rule__antsoc_007`

  - `mh_p_asr__tho_001`

  - `mh_p_asr__tho_002`

  - `mh_p_asr__tho_005`

  - `mh_p_asr__tho_006`

  - `mh_p_asr__tho_007`

  - `mh_p_asr__tho__dep_001`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_p_asr__critic

compute_mh_p_asr__critic_nm(
  data,
  name = "mh_p_asr__critic_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__critic` is vector of all column names used to compute
summary score of `mh_p_asr__critic` scores.

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
compute_mh_p_asr__critic_nm(data) |>
  select(
    any_of(c("mh_p_asr__critic_nm", vars_mh_p_asr__critic))
  )
} # }
```
