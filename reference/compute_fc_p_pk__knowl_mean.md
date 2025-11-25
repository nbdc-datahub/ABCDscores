# Compute "Parental Knowledge Scale \[Parent\]: Mean"

Computes the summary score `fc_p_pk__knowl_mean` (Parental Knowledge
Scale \[Parent\]: Mean)

- *Summarized variables:*

  - `fc_p_pk__knowl_001`

  - `fc_p_pk__knowl_002`

  - `fc_p_pk__knowl_003`

  - `fc_p_pk__knowl_004`

  - `fc_p_pk__knowl_005`

  - `fc_p_pk__knowl_006`

  - `fc_p_pk__knowl_007`

  - `fc_p_pk__knowl_008`

  - `fc_p_pk__knowl_009`

- *Excluded values:*

  - 777

- *Validation criterion:* maximally 1 of 9 items missing

- *Notes:* All items are reverse coded before computing the summary
  score.

## Usage

``` r
vars_fc_p_pk__knowl

compute_fc_p_pk__knowl_mean(
  data,
  name = "fc_p_pk__knowl_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_fc_p_pk\_\_knowl is a character vector of all column names used to
compute summary score of `fc_p_pk__knowl`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
