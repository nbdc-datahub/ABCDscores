# Compute "Caffeine Use Questionnaire \[Youth\] (Other): Sum \[Validation: None\]"

Computes the summary score `su_y_caff__oth_sum` Caffeine Use
Questionnaire \[Youth\] (Other): Sum \[Validation: None\]

- *Summarized variables:*

  - `su_y_caff__oth_001__01`

  - `su_y_caff__oth_001__02`

  - `su_y_caff__oth_001__l`

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
vars_su_y_caff__oth

compute_su_y_caff__oth_sum(data, name = "su_y_caff__oth_sum", combine = TRUE)
```

## Format

vars_su_y_caff\_\_oth is a character vector of all column names used to
compute `compute_su_y_caff__oth_sum`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.
