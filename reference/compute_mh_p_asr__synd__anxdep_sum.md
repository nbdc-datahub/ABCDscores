# Compute "Adult Self Report \[Parent\] (Syndrome Scale - Anxious/Depressed): Sum"

Computes the summary score `mh_p_asr__synd__anxdep_sum` Adult Self
Report \[Parent\] (Syndrome Scale - Anxious/Depressed): Sum

- *Summarized variables:*

  - `mh_p_asr__anxdep_001`

  - `mh_p_asr__anxdep_002`

  - `mh_p_asr__anxdep_003`

  - `mh_p_asr__anxdep_004`

  - `mh_p_asr__anxdep_005`

  - `mh_p_asr__anxdep_006`

  - `mh_p_asr__anxdep__anx_001`

  - `mh_p_asr__anxdep__anx_002`

  - `mh_p_asr__anxdep__anx_003`

  - `mh_p_asr__anxdep__anx_004`

  - `mh_p_asr__anxdep__avoid_001`

  - `mh_p_asr__anxdep__avoid_002`

  - `mh_p_asr__anxdep__dep_001`

  - `mh_p_asr__anxdep__dep_002`

  - `mh_p_asr__anxdep__dep_003`

  - `mh_p_asr__anxdep__dep_004`

  - `mh_p_asr__anxdep__dep_005`

  - `mh_p_asr__anxdep__dep_006`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 1 of 18 items missing

## Usage

``` r
compute_mh_p_asr__synd__anxdep_sum(
  data,
  name = "mh_p_asr__synd__anxdep_sum",
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

[`compute_mh_p_asr__synd__anxdep_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__synd__anxdep_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__synd__anxdep_sum(data) |>
  select(
    any_of(c("mh_p_asr__synd__anxdep_sum", vars_mh_p_asr__synd__anxdep))
  )
} # }
```
