# Compute "Resistance to Peer Influence \[Youth\]: Mean"

Computes the summary score `fc_y_rpi_mean` (Resistance to Peer Influence
\[Youth\]: Mean)

- *Summarized variables:*

  - `fc_y_rpi_001`

  - `fc_y_rpi_002`

  - `fc_y_rpi_003`

  - `fc_y_rpi_004`

  - `fc_y_rpi_005`

  - `fc_y_rpi_006`

  - `fc_y_rpi_007`

  - `fc_y_rpi_008`

  - `fc_y_rpi_009`

  - `fc_y_rpi_010`

- *Excluded values:* none

- *Validation criterion:* maximally 3 of 10 items missing

- *Note:* The following variables are reverse coded before computing the
  summary score:

  - `fc_y_rpi_002`

  - `fc_y_rpi_006`

  - `fc_y_rpi_010`

## Usage

``` r
vars_fc_y_rpi

compute_fc_y_rpi_mean(data, name = "fc_y_rpi_mean", max_na = 3, combine = TRUE)
```

## Format

vars_fc_y_rpi is a character vector of all column names used to compute
summary score of `fc_y_rpi`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 3).

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
