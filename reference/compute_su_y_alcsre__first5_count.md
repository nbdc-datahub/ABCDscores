# Compute "Alcohol Subject Response and Effects \[Youth\] (First 5 times ever drank): Count \[Validation: None missing or declined\]"

Computes the summary score `su_y_alcsre__first5_count` Alcohol Subject
Response and Effects \[Youth\] (First 5 times ever drank): Count
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
compute_su_y_alcsre__first5_count(
  data,
  name = "su_y_alcsre__first5_count",
  combine = TRUE,
  max_na = 0
)
```

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
