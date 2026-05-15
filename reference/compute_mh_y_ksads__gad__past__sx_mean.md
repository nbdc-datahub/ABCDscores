# Compute "KSADS - Generalized Anxiety Disorder \[Youth\] (Symptom - Past): Mean"

Computes the summary score `mh_y_ksads__gad__past__sx_mean` KSADS -
Generalized Anxiety Disorder \[Youth\] (Symptom - Past): Mean
\[Validation: No more than 0 missing or declined\]

- *Summarized variables:*

  - `mh_y_ksads__gad__worry__6mo__past_sx`

  - `mh_y_ksads__gad__worry__diffctrl__past_sx`

  - `mh_y_ksads__gad__worry__excess__past_sx`

  - `mh_y_ksads__gad__worry__multi__past_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 0 of 4 items missing

## Usage

``` r
vars_mh_y_ksads__gad__past__sx

compute_mh_y_ksads__gad__past__sx_mean(
  data,
  name = "mh_y_ksads__gad__past__sx_mean",
  max_na = 0,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_mh_y_ksads\_\_gad\_\_past\_\_sx is a character vector of all column
names used to compute summary score of `mh_y_ksads__gad__past__sx_mean`

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
