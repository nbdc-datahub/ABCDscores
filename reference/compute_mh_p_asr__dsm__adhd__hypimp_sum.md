# Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD Hyperactivity-Impulsivity): Sum"

Computes the summary score `mh_p_asr__dsm__adhd__hypimp_sum` Adult Self
Report \[Parent\] (DSM-5 Oriented Scale - ADHD
Hyperactivity-Impulsivity): Sum

- *Summarized variables:*

  - `mh_p_asr__aggr__hypimp_001`

  - `mh_p_asr__othpr__hypimp_001`

  - `mh_p_asr__othpr__hypimp_002`

  - `mh_p_asr__othpr__hypimp_003`

  - `mh_p_asr__rule__hypimp_001`

  - `mh_p_asr__tho__hypimp_001`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 6 items missing

## Usage

``` r
compute_mh_p_asr__dsm__adhd__hypimp_sum(
  data,
  name = "mh_p_asr__dsm__adhd__hypimp_sum",
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

[`compute_mh_p_asr__dsm__adhd__hypimp_nm()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_mh_p_asr__dsm__adhd__hypimp_nm.md)

## Examples

``` r
if (FALSE) { # \dontrun{
compute_mh_p_asr__dsm__adhd__hypimp_sum(data) |>
  select(
    any_of(c("mh_p_asr__dsm__adhd__hypimp_sum", vars_mh_p_asr__dsm__adhd__hypimp))
  )
} # }
```
