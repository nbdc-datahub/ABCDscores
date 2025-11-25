# Compute "Youth Screen Time \[Parent\] (Weekend): Sum"

Computes the summary score `nt_p_yst__screen__wknd_sum` Youth Screen
Time \[Parent\] (Weekend): Sum

- *Summarized variables:*

  - `nt_p_yst__wknd__hr_001`

  - `nt_p_yst__wknd__min_001`

  - `nt_p_yst__wknd__min_001__v01`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* maximally 0 of 1 item missing

## Usage

``` r
vars_nt_p_yst__screen__wknd

compute_nt_p_yst__screen__wknd_sum(
  data,
  name = "nt_p_yst__screen__wknd_sum",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_nt_p_yst\_\_screen\_\_wknd is a character vector of all column
names used to compute summary score of `nt_p_yst__screen__wknd`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 0).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.
