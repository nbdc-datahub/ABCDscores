# Compute "KSADS - Post-Traumatic Stress Disorder \[Youth\] (Symptom - Past): Mean"

Computes the summary score `mh_y_ksads__ptsd__past__sx_mean` KSADS -
Post-Traumatic Stress Disorder \[Youth\] (Symptom - Past): Mean
\[Validation: No more than 4 missing or declined\]

- *Summarized variables:*

  - `mh_y_ksads__ptsd__anhed__past_sx`

  - `mh_y_ksads__ptsd__avoid__extrmnd__past_sx`

  - `mh_y_ksads__ptsd__avoid__trmatho__past_sx`

  - `mh_y_ksads__ptsd__concprob__past_sx`

  - `mh_y_ksads__ptsd__depersnl__past_sx`

  - `mh_y_ksads__ptsd__derealztn__past_sx`

  - `mh_y_ksads__ptsd__detach__past_sx`

  - `mh_y_ksads__ptsd__distortcog__cause__past_sx`

  - `mh_y_ksads__ptsd__distortcog__consq__past_sx`

  - `mh_y_ksads__ptsd__emot__neg__past_sx`

  - `mh_y_ksads__ptsd__emot__nopos__past_sx`

  - `mh_y_ksads__ptsd__extrmnd__distrs__past_sx`

  - `mh_y_ksads__ptsd__flshbck__past_sx`

  - `mh_y_ksads__ptsd__hyprvigl__past_sx`

  - `mh_y_ksads__ptsd__intrmnd__distrs__past_sx`

  - `mh_y_ksads__ptsd__irrit__past_sx`

  - `mh_y_ksads__ptsd__memloss__past_sx`

  - `mh_y_ksads__ptsd__negblf__past_sx`

  - `mh_y_ksads__ptsd__nghtmr__past_sx`

  - `mh_y_ksads__ptsd__physreact__past_sx`

  - `mh_y_ksads__ptsd__rckls__past_sx`

  - `mh_y_ksads__ptsd__sleepdistb__past_sx`

  - `mh_y_ksads__ptsd__startle__past_sx`

  - `mh_y_ksads__ptsd__trmatho__intru__past_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 4 of 24 items missing

## Usage

``` r
vars_mh_y_ksads__ptsd__past__sx

compute_mh_y_ksads__ptsd__past__sx_mean(
  data,
  name = "mh_y_ksads__ptsd__past__sx_mean",
  max_na = 4,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_mh_y_ksads\_\_ptsd\_\_past\_\_sx is a character vector of all
column names used to compute summary score of
`mh_y_ksads__ptsd__past__sx_mean`

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
