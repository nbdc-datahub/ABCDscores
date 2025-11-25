# Compute "Caffeine Use Questionnaire \[Youth\] (Energy shot): Sum \[Validation: None\]"

Computes the summary score `su_y_caff__energy__shot_sum` Caffeine Use
Questionnaire \[Youth\] (Energy shot): Sum \[Validation: None\]

- *Summarized variables:*

  - `su_y_caff__energy__shot_001__01`

  - `su_y_caff__energy__shot_001__02`

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
vars_su_y_caff__energy__shot

compute_su_y_caff__energy__shot_sum(
  data,
  name = "su_y_caff__energy__shot_sum",
  combine = TRUE
)
```

## Format

vars_su_y_caff\_\_energy\_\_shot is a character vector of all column
names used to compute `compute_su_y_caff__energy__shot_sum`.

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
