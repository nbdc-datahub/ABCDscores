# Compute "Alcohol Subject Response and Effects \[Youth\] (First 5 times ever drank): Mean \[Validation: None missing or declined\]"

Computes the summary score `su_y_alcsre__first5_mean` Alcohol Subject
Response and Effects \[Youth\] (First 5 times ever drank): Mean
\[Validation: None missing or declined\]

- *Summarized variables:*

  - `su_y_alcsre__first5_001`

  - `su_y_alcsre__first5_002`

  - `su_y_alcsre__first5_003`

  - `su_y_alcsre__first5_004`

- *Excluded values:* none

- *Validation criterion:* maximally 0 of 4 items missing

## Usage

``` r
vars_su_y_alcsre__first5

compute_su_y_alcsre__first5_mean(
  data,
  name = "su_y_alcsre__first5_mean",
  combine = TRUE,
  max_na = 0
)
```

## Format

vars_su_y_alcsre\_\_first5 is a character vector of all column names
used to compute summary scores of `compute_su_y_alcsre__first5`
(`_mean`, `_count`, `_nm`).

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
  (Default: 0).

## Value

tbl. The input data frame with the summary score appended as a new
column.
