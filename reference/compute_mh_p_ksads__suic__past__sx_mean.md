# Compute "KSADS - Suicidality \[Parent\] (Symptom - Past): Mean"

Computes the summary score `mh_p_ksads__suic__past__sx_mean` KSADS -
Suicidality \[Parent\] (Symptom - Past): Mean \[validation: No more than
2 missing or declined\]

- *Summarized variables:*

  - `mh_p_ksads__suic__slfinj__past_sx`

  - `mh_p_ksads__suic__slfinj__nointnt__past_sx`

  - `mh_p_ksads__suic__slfinj__intnt__past_sx`

  - `mh_p_ksads__suic__slfinj__psbldie__past_sx`

  - `mh_p_ksads__suic__idea__past_sx`

  - `mh_p_ksads__suic__intnt__past_sx`

  - `mh_p_ksads__suic__mthd__past_sx`

  - `mh_p_ksads__suic__plan__past_sx`

  - `mh_p_ksads__suic__prep__past_sx`

  - `mh_p_ksads__suic__attmpt__past_sx`

  - `mh_p_ksads__suic__attmpt__intrpt__past_sx`

  - `mh_p_ksads__suic__attmpt__psbldie__past_sx`

  - `mh_p_ksads__suic__wishdead__past_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 2 of 13 items missing

## Usage

``` r
vars_mh_p_ksads__suic__past__sx

compute_mh_p_ksads__suic__past__sx_mean(
  data,
  name = "mh_p_ksads__suic__past__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_mh_p_ksads\_\_suic\_\_past\_\_sx is a character vector of all
column names used to compute summary score of
`mh_p_ksads__suic__past__sx_mean`

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- max_na:

  numeric, positive whole number. Number of missing items allowed.
  `NULL` means no limit.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

## Value

tbl. see `combine`.

## Details

KSADS summary scores are mostly calculating the means over variables,
but there are two special codes to handle:

- `"888"`: item skipped by branching. When at least one input value is
  observed, any `888` value is converted to "0" prior to averaging.

- `"555"`: module not administered. If any input variable is "555" leave
  the score as `NA`.

- `NA`: missing value. If at least one input value is observed, any `NA`
  values are converted to "0" prior to averaging. If all inputs are
  `NA`, the summary score remains `NA`.
