# Compute "Youth Self Report \[Youth\]: Number missing"

Computes the summary score `mh_y_ysr_nm` Youth Self Report \[Youth\]:
Number missing

- *Summarized variables:*

  - `mh_y_ysr__attn__adhd_001`

  - `mh_y_ysr__attn__adhd_002`

  - `mh_y_ysr__attn__adhd_003`

  - `mh_y_ysr__attn__adhd_004`

  - `mh_y_ysr__attn__adhd_005`

  - `mh_y_ysr__othpr__adhd_001`

  - `mh_y_ysr__aggr__adhd_001`

  - `mh_y_ysr__soc__anx_001`

  - `mh_y_ysr__anxdep__anx_001`

  - `mh_y_ysr__anxdep__anx_002`

  - `mh_y_ysr__anxdep__anx_003`

  - `mh_y_ysr__anxdep__anx_004`

  - `mh_y_ysr__som__anx_001`

  - `mh_y_ysr__anxdep__anx_005`

  - `mh_y_ysr__anxdep__anx_006`

  - `mh_y_ysr__anxdep__anx_007`

  - `mh_y_ysr__aggr__cond_001`

  - `mh_y_ysr__aggr__cond_002`

  - `mh_y_ysr__rule__cond_001`

  - `mh_y_ysr__rule__cond_002`

  - `mh_y_ysr__aggr__cond_003`

  - `mh_y_ysr__rule__cond_003`

  - `mh_y_ysr__rule__cond_004`

  - `mh_y_ysr__aggr__cond_004`

  - `mh_y_ysr__rule__cond_005`

  - `mh_y_ysr__rule__cond_006`

  - `mh_y_ysr__rule__cond_007`

  - `mh_y_ysr__rule__cond_008`

  - `mh_y_ysr__rule__cond_009`

  - `mh_y_ysr__aggr__cond_005`

  - `mh_y_ysr__rule__cond_010`

  - `mh_y_ysr__wthdep__dep_001`

  - `mh_y_ysr__anxdep__dep_001`

  - `mh_y_ysr__tho__dep_001`

  - `mh_y_ysr__othpr__dep_001`

  - `mh_y_ysr__anxdep__dep_002`

  - `mh_y_ysr__anxdep__dep_003`

  - `mh_y_ysr__som__dep_001`

  - `mh_y_ysr__tho__dep_002`

  - `mh_y_ysr__othpr__dep_002`

  - `mh_y_ysr__anxdep__dep_004`

  - `mh_y_ysr__tho__dep_003`

  - `mh_y_ysr__wthdep__dep_002`

  - `mh_y_ysr__wthdep__dep_003`

  - `mh_y_ysr__aggr__opp_001`

  - `mh_y_ysr__aggr__opp_002`

  - `mh_y_ysr__aggr__opp_003`

  - `mh_y_ysr__aggr__opp_004`

  - `mh_y_ysr__aggr__opp_005`

  - `mh_y_ysr__som__somat_001`

  - `mh_y_ysr__som__somat_002`

  - `mh_y_ysr__som__somat_003`

  - `mh_y_ysr__som__somat_004`

  - `mh_y_ysr__som__somat_005`

  - `mh_y_ysr__som__somat_006`

  - `mh_y_ysr__som__somat_007`

  - `mh_y_ysr__aggr_001`

  - `mh_y_ysr__aggr_002`

  - `mh_y_ysr__aggr_003`

  - `mh_y_ysr__aggr_004`

  - `mh_y_ysr__aggr_005`

  - `mh_y_ysr__aggr_006`

  - `mh_y_ysr__anxdep_001`

  - `mh_y_ysr__anxdep_002`

  - `mh_y_ysr__attn_001`

  - `mh_y_ysr__attn_002`

  - `mh_y_ysr__attn_003`

  - `mh_y_ysr__attn_004`

  - `mh_y_ysr__rule_001`

  - `mh_y_ysr__rule_002`

  - `mh_y_ysr__rule_003`

  - `mh_y_ysr__rule_004`

  - `mh_y_ysr__rule_005`

  - `mh_y_ysr__wthdep_001`

  - `mh_y_ysr__wthdep_002`

  - `mh_y_ysr__wthdep_003`

  - `mh_y_ysr__wthdep_004`

  - `mh_y_ysr__wthdep_005`

  - `mh_y_ysr__som_001`

  - `mh_y_ysr__othpr_001`

  - `mh_y_ysr__othpr_002`

  - `mh_y_ysr__othpr_003`

  - `mh_y_ysr__othpr_004`

  - `mh_y_ysr__othpr_005`

  - `mh_y_ysr__othpr_006`

  - `mh_y_ysr__othpr_007`

  - `mh_y_ysr__soc_001`

  - `mh_y_ysr__soc_002`

  - `mh_y_ysr__soc_003`

  - `mh_y_ysr__soc_004`

  - `mh_y_ysr__soc_005`

  - `mh_y_ysr__soc_006`

  - `mh_y_ysr__soc_007`

  - `mh_y_ysr__soc_008`

  - `mh_y_ysr__soc_009`

  - `mh_y_ysr__soc_010`

  - `mh_y_ysr__tho_001`

  - `mh_y_ysr__tho_002`

  - `mh_y_ysr__tho_003`

  - `mh_y_ysr__tho_004`

  - `mh_y_ysr__tho_005`

  - `mh_y_ysr__tho_006`

  - `mh_y_ysr__tho_007`

  - `mh_y_ysr__tho_008`

  - `mh_y_ysr__tho_009`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_mh_y_ysr

compute_mh_y_ysr_nm(
  data,
  name = "mh_y_ysr_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_y_ysr` is vector of all column names used to compute summary
score of `mh_y_ysr` scores.

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
compute_mh_y_ysr_nm(data) |>
  select(
    any_of(c("mh_y_ysr_nm", vars_mh_y_ysr))
  )
} # }
```
