# Compute "KSADS - Alcohol Use Disorder \[Youth\] (Symptom - Present): Mean"

Computes the summary score `su_y_ksads__aud__pres__sx_mean` KSADS -
Alcohol Use Disorder \[Youth\] (Symptom - Present): Mean \[Validation:
No more than 2 missing or declined\]

- *Summarized variables:*

  - `su_y_ksads__aud__actvdecr__pres_sx`

  - `su_y_ksads__aud__crave__pres_sx`

  - `su_y_ksads__aud__dwi__pres_sx`

  - `su_y_ksads__aud__failrespons__pres_sx`

  - `su_y_ksads__aud__haz__pres_sx`

  - `su_y_ksads__aud__negimpct__interprs__pres_sx`

  - `su_y_ksads__aud__overuse__pres_sx`

  - `su_y_ksads__aud__prob__phys__pres_sx`

  - `su_y_ksads__aud__prob__psych__pres_sx`

  - `su_y_ksads__aud__reduce__dsr__pres_sx`

  - `su_y_ksads__aud__reduce__unsucces__pres_sx`

  - `su_y_ksads__aud__time__pres_sx`

  - `su_y_ksads__aud__tol__pres_sx`

  - `su_y_ksads__aud__withdr__pres_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 2 of 14 items missing

## Usage

``` r
vars_su_y_ksads__aud__pres__sx

compute_su_y_ksads__aud__pres__sx_mean(
  data,
  name = "su_y_ksads__aud__pres__sx_mean",
  max_na = 2,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_su_y_ksads\_\_aud\_\_pres\_\_sx is a character vector of all column
names used to compute summary score of `su_y_ksads__aud__pres__sx_mean`

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
