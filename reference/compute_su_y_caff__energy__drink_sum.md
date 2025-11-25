# Compute "Caffeine Use Questionnaire \[Youth\] (Energy drink): Sum \[Validation: None\]"

Computes the summary score `su_y_caff__energy__drink_sum` Caffeine Use
Questionnaire \[Youth\] (Energy drink): Sum \[Validation: None\]

- *Summarized variables:*

  - `su_y_caff__energy__drink_001__01__01`

  - `su_y_caff__energy__drink_001__01__02`

  - `su_y_caff__energy__drink_001__01__03`

  - `su_y_caff__energy__drink_001__02__01`

  - `su_y_caff__energy__drink_001__02__02`

  - `su_y_caff__energy__drink_001__02__03`

  - `su_y_caff__energy__drink_001__03__01`

  - `su_y_caff__energy__drink_001__03__02`

  - `su_y_caff__energy__drink_001__03__03`

  - `su_y_caff__energy__drink_001__04__01`

  - `su_y_caff__energy__drink_001__04__02`

  - `su_y_caff__energy__drink_001__04__03`

- *Excluded values:* none

- *Validation criterion:* none

## Usage

``` r
vars_su_y_caff__energy__drink

compute_su_y_caff__energy__drink_sum(
  data,
  name = "su_y_caff__energy__drink_sum",
  combine = TRUE
)
```

## Format

vars_su_y_caff\_\_energy\_\_drink is a character vector of all column
names used to compute `compute_su_y_caff__energy__drink_sum`.

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
