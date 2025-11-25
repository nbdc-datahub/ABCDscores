# Compute "Adult Self Report \[Parent\] (DSM-5 Oriented Scale - ADHD Hyperactivity-Impulsivity): Number missing"

Computes the summary score `mh_p_asr__dsm__adhd__hypimp_nm` Adult Self
Report \[Parent\] (DSM-5 Oriented Scale - ADHD
Hyperactivity-Impulsivity): Number missing

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

## Usage

``` r
vars_mh_p_asr__dsm__adhd__hypimp

compute_mh_p_asr__dsm__adhd__hypimp_nm(
  data,
  name = "mh_p_asr__dsm__adhd__hypimp_nm",
  exclude = c("777", "999"),
  combine = TRUE
)
```

## Format

`vars_mh_p_asr__dsm__adhd__hypimp` is vector of all column names used to
compute summary score of `mh_p_asr__dsm__adhd__hypimp` scores.

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
compute_mh_p_asr__dsm__adhd__hypimp_nm(data) |>
  select(
    any_of(c("mh_p_asr__dsm__adhd__hypimp_nm", vars_mh_p_asr__dsm__adhd__hypimp))
  )
} # }
```
