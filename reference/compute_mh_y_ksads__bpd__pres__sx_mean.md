# Compute "KSADS - Bipolar Disorders \[Youth\] (Symptom - Present): Mean"

Computes the summary score `mh_y_ksads__bpd__pres__sx_mean` KSADS -
Bipolar Disorders \[Youth\] (Symptom - Present): Mean \[Validation: No
more than 3 missing or declined\]

- *Summarized variables:*

  - `mh_y_ksads__bpd__distract__incr__pres_sx`

  - `mh_y_ksads__bpd__distract__pres_sx`

  - `mh_y_ksads__bpd__enrg__incr__pres_sx`

  - `mh_y_ksads__bpd__flgtid__pres_sx`

  - `mh_y_ksads__bpd__goaldir__incr__pres_sx`

  - `mh_y_ksads__bpd__grndios__pres_sx`

  - `mh_y_ksads__bpd__hyprsex__pres_sx`

  - `mh_y_ksads__bpd__irrit__expl__pres_sx`

  - `mh_y_ksads__bpd__irrit__manic__pres_sx`

  - `mh_y_ksads__bpd__mood__elv__pres_sx`

  - `mh_y_ksads__bpd__mood__euph__pres_sx`

  - `mh_y_ksads__bpd__prspch__pres_sx`

  - `mh_y_ksads__bpd__psymot__agit__pres_sx`

  - `mh_y_ksads__bpd__ractho__pres_sx`

  - `mh_y_ksads__bpd__riskactv__pres_sx`

  - `mh_y_ksads__bpd__slpdecr__pres_sx`

- *Excluded values:*

  - 555

- *Validation criterion:* maximally 3 of 16 items missing

## Usage

``` r
vars_mh_y_ksads__bpd__pres__sx

compute_mh_y_ksads__bpd__pres__sx_mean(
  data,
  name = "mh_y_ksads__bpd__pres__sx_mean",
  max_na = 3,
  exclude = c("555"),
  combine = TRUE
)
```

## Format

vars_mh_y_ksads\_\_bpd\_\_pres\_\_sx is a character vector of all column
names used to compute summary score of `mh_y_ksads__bpd__pres__sx_mean`

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
