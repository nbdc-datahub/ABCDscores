# Compute "Ohio State Traumatic Brain Injury Screen \[Parent\] (Repeated injuries): Count"

Computes the summary score `ph_p_otbi__rpt_count` Ohio State Traumatic
Brain Injury Screen \[Parent\] (Repeated injuries): Count \[Validation:
No more than 2 missing or declined at baseline and no more than 0
missing or declined at non-baseline events\]

- *Summarized variables:*

  - `ph_p_otbi__rpt_001`

  - `ph_p_otbi__rpt_002`

  - `ph_p_otbi__rpt_003`

  - `ph_p_otbi__rpt_001__l`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:*

  - maximally 2 item missing at baseline event

  - maximally 0 item missing at non-baseline events

## Usage

``` r
vars_ph_p_otbi__rpt_count

compute_ph_p_otbi__rpt_count(
  data,
  name = "ph_p_otbi__rpt_count",
  exclude = c("777", "999"),
  combine = TRUE,
  max_na = 2
)
```

## Format

vars_ph_p_otbi\_\_rpt_count is a character vector of all column names
used to compute summary score of `ph_p_otbi__rpt_count`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score column.

- exclude:

  character vector. Values to be excluded from the summary score
  calculation.

- combine:

  logical. If `TRUE` (default), the summary score is is appended as a
  new column to the input data frame. If `FALSE`, the summary score is
  returned as a separate one-column data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 2).

## Value

tbl. The input data frame with the summary score appended as a new
column.
