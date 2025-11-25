# Compute "Life Events \[Youth\] (Events): Count \[Validation: No more than 5 missing or declined\]"

Computes the summary score `mh_y_ple_count` Life Events \[Youth\]
(Events): Count \[Validation: No more than 5 missing or declined\]

- *Summarized variables:*

  - `mh_y_ple_001`

  - `mh_y_ple_002`

  - `mh_y_ple_003`

  - `mh_y_ple_004`

  - `mh_y_ple_005`

  - `mh_y_ple_006`

  - `mh_y_ple_007`

  - `mh_y_ple_008`

  - `mh_y_ple_009`

  - `mh_y_ple_010`

  - `mh_y_ple_011`

  - `mh_y_ple_012`

  - `mh_y_ple_013`

  - `mh_y_ple_014`

  - `mh_y_ple_015`

  - `mh_y_ple_016`

  - `mh_y_ple_017`

  - `mh_y_ple_018`

  - `mh_y_ple_019`

  - `mh_y_ple_020`

  - `mh_y_ple_021`

  - `mh_y_ple_022`

  - `mh_y_ple_023`

  - `mh_y_ple_024`

  - `mh_y_ple_025`

- *Excluded values:*

  - 444

  - 777

  - 999

- *Validation criterion:* maximally 5 of 25 items missing

## Usage

``` r
vars_mh_y_ple

compute_mh_y_ple_count(
  data,
  name = "mh_y_ple_count",
  combine = TRUE,
  max_na = 5
)
```

## Format

vars_mh_y_ple is a character vector of all column names used to compute
summary score of `mh_y_ple`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 5).

## Value

tbl. The input data frame with the summary score appended as a new
column.
