# Compute "Screen Time \[Youth\] (Weekday): Sum"

Computes the summary score `nt_y_stq__screen__wkdy_sum` Screen Time
\[Youth\] (Weekday): Sum

- *Summarized variables:*

  - `nt_y_stq__screen__wkdy_001`

  - `nt_y_stq__screen__wkdy_002`

  - `nt_y_stq__screen__wkdy_003`

  - `nt_y_stq__screen__wkdy_004`

  - `nt_y_stq__screen__wkdy_005`

  - `nt_y_stq__screen__wkdy_006`

  - `nt_y_stq__screen__wkdy__hr_001`

  - `nt_y_stq__screen__wkdy__min_001`

  - `nt_y_stq__screen__wkdy__hr_001__v01`

  - `nt_y_stq__screen__wkdy__min_001__v01`

  - `nt_y_stq__screen__wkdy__hr_002`

  - `nt_y_stq__screen__wkdy__min_002`

  - `nt_y_stq__screen__wkdy__hr_003`

  - `nt_y_stq__screen__wkdy__min_003`

  - `nt_y_stq__screen__wkdy__hr_004`

  - `nt_y_stq__screen__wkdy__min_004`

  - `nt_y_stq__screen__wkdy__hr_005`

  - `nt_y_stq__screen__wkdy__min_005`

  - `nt_y_stq__screen__wkdy__hr_006`

  - `nt_y_stq__screen__wkdy__min_006`

  - `nt_y_stq__screen__wkdy__hr_007`

  - `nt_y_stq__screen__wkdy__min_007`

  - `nt_y_stq__screen__wkdy__hr_008`

  - `nt_y_stq__screen__wkdy__min_008`

  - `nt_y_stq__screen__wkdy__hr_009`

  - `nt_y_stq__screen__wkdy__min_009`

- *Excluded values:*

  - 777

  - 999

- *Validation criterion:* none missing

## Usage

``` r
vars_nt_y_stq__screen__wkdy

compute_nt_y_stq__screen__wkdy_sum(
  data,
  name = "nt_y_stq__screen__wkdy_sum",
  max_na = 0,
  combine = TRUE
)
```

## Format

vars_nt_y_stq\_\_screen\_\_wkdy is a character vector of all column
names used to compute summary score of `nt_y_stq__screen__wkdy`.

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
