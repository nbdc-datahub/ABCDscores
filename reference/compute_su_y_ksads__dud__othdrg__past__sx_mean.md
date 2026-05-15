# Compute "KSADS - Drug Use Disorders \[Youth\] (Symptom: Other drugs - Past): Mean"

Computes the summary score `su_y_ksads__dud__othdrg__past__sx_mean`
KSADS - Drug Use Disorders \[Youth\] (Symptom: Other drugs - Past): Mean
\[Validation: No more than 3 missing or declined\]

- *Summarized variables:*

  - `su_y_ksads__dud__actvdecr__othdrg__past_sx`

  - `su_y_ksads__dud__crave__othdrg__past_sx`

  - `su_y_ksads__dud__dwi__othdrg__past_sx`

  - `su_y_ksads__dud__failrespons__othdrg__past_sx`

  - `su_y_ksads__dud__haz__othdrg__past_sx`

  - `su_y_ksads__dud__negimpct__interprs__othdrg__past_sx`

  - `su_y_ksads__dud__negimpct__obl__othdrg__past_sx`

  - `su_y_ksads__dud__overuse__othdrg__past_sx`

  - `su_y_ksads__dud__prob__phys__othdrg__past_sx`

  - `su_y_ksads__dud__prob__psych__othdrg__past_sx`

  - `su_y_ksads__dud__reduce__dsr__othdrg__past_sx`

  - `su_y_ksads__dud__reduce__unsucces__othdrg__past_sx`

  - `su_y_ksads__dud__time__othdrg__past_sx`

  - `su_y_ksads__dud__tol__othdrg__past_sx`

  - `su_y_ksads__dud__withdr__othdrg__past_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 3 of 15 items missing

## Usage

``` r
vars_su_y_ksads__dud__othdrg__past__sx_mean

compute_su_y_ksads__dud__othdrg__past__sx_mean(
  data,
  name = "su_y_ksads__dud__othdrg__past__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_su_y_ksads\_\_dud\_\_othdrg\_\_past\_\_sx_mean is a character
vector of all column names used to compute summary score of
`su_y_ksads__dud__othdrg__past__sx_mean`

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
