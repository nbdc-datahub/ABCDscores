# Compute "Adult Self Report \[Parent\] (Syndrome Scale - Externalizing): Sum"

Computes the summary score `mh_p_asr__synd__ext_sum` Adult Self Report
\[Parent\] (Syndrome Scale - Externalizing): Sum

- *Summarized variables:*

  - `mh_p_asr__intru_001`

  - `mh_p_asr__intru_002`

  - `mh_p_asr__intru_003`

  - `mh_p_asr__intru_004`

  - `mh_p_asr__intru_005`

  - `mh_p_asr__intru_006`

  - `mh_p_asr__rule_001`

  - `mh_p_asr__rule_002`

  - `mh_p_asr__rule_003`

  - `mh_p_asr__rule_004`

  - `mh_p_asr__rule__hypimp_001`

  - `mh_p_asr__rule__antsoc_001`

  - `mh_p_asr__rule__antsoc_002`

  - `mh_p_asr__rule__antsoc_003`

  - `mh_p_asr__rule__antsoc_004`

  - `mh_p_asr__rule__antsoc_005`

  - `mh_p_asr__rule__antsoc_006`

  - `mh_p_asr__rule__antsoc_007`

  - `mh_p_asr__rule__antsoc_008`

  - `mh_p_asr__rule__antsoc_009`

  - `mh_p_asr__aggr_001`

  - `mh_p_asr__aggr_002`

  - `mh_p_asr__aggr_003`

  - `mh_p_asr__aggr_004`

  - `mh_p_asr__aggr_005`

  - `mh_p_asr__aggr_006`

  - `mh_p_asr__aggr__hypimp_001`

  - `mh_p_asr__aggr__antsoc_001`

  - `mh_p_asr__aggr__antsoc_002`

  - `mh_p_asr__aggr__antsoc_003`

  - `mh_p_asr__aggr__antsoc_004`

  - `mh_p_asr__aggr__antsoc_005`

  - `mh_p_asr__aggr__antsoc_006`

  - `mh_p_asr__aggr__antsoc_007`

  - `mh_p_asr__aggr__antsoc_008`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 2 of 35 items missing

## Usage

``` r
compute_mh_p_asr__synd__ext_sum(
  data,
  name = "mh_p_asr__synd__ext_sum",
  max_na = 2,
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

[`compute_mh_p_asr__synd__ext_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__synd__ext_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__synd__ext_sum(data) |>
  select(
    any_of(c("mh_p_asr__synd__ext_sum", vars_mh_p_asr__synd__ext))
  )
} # }
```
