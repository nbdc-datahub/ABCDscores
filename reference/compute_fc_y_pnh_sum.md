# Compute "Peer Network Health \[Youth\]: Sum"

Computes the summary score `fc_y_pnh_sum` (Peer Network Health
\[Youth\]: Sum)

- *Summarized variables:*

  - `fc_y_pnh_001`

  - `fc_y_pnh_002`

  - `fc_y_pnh_002__01`

  - `fc_y_pnh_003`

  - `fc_y_pnh_003__01`

- *Excluded values:* none

- *Validation criterion:* none of 5 items missing

- *Notes:*

  - `fc_y_pnh_001` is scored: No = 0; Yes = 3

  - `fc_y_pnh_002`/`fc_y_pnh_003` are scored: No = 0; Yes = 2

  - `fc_y_pnh_002__01`/`fc_y_pnh_003__01` are scored with their original
    values (1 through 10)

## Usage

``` r
vars_fc_y_pnh

compute_fc_y_pnh_sum(data, name = "fc_y_pnh_sum", max_na = 0, combine = TRUE)
```

## Format

vars_fc_y_pnh is a character vector of all column names used to compute
summary score of `fc_y_pnh`.

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
