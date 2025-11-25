# Compute "School Risk & Protective Factors \[Youth\] (School involvement): Mean"

Computes the summary score `fc_y_srpf__involv_mean` (School Risk &
Protective Factors \[Youth\] (School involvement): Mean)

- *Summarized variables:*

  - `fc_y_srpf__involv_001`

  - `fc_y_srpf__involv_002`

  - `fc_y_srpf__involv_003`

  - `fc_y_srpf__involv_004`

- *Excluded values:* none

- *Validation criterion:* none of 4 items missing

## Usage

``` r
vars_fc_y_srpf__involv

compute_fc_y_srpf__involv_mean(
  data,
  name = "fc_y_srpf__involv_mean",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_fc_y_srpf\_\_involv is a character vector of all column names used
to compute summary score of `fc_y_srpf__involv`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 0).

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
