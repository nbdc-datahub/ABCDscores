# Compute "ENDS Expectancies \[Youth\] (Strength of positive expectancies): Prorated sum"

Computes the summary score `su_y_nicvapeexp__pos_prsum` ENDS
Expectancies \[Youth\] (Strength of positive expectancies): Prorated sum
\[Validation: No more than 2 missing or declined\]

- *Summarized variables:*

  - `su_y_nicvapeexp__pos_001`

  - `su_y_nicvapeexp__pos_002`

  - `su_y_nicvapeexp__pos_003`

  - `su_y_nicvapeexp__pos_004`

- *Excluded values:* none

- *Validation criterion:* maximally 2 of 4 items missing

## Usage

``` r
vars_su_y_nicvapeexp__pos

compute_su_y_nicvapeexp__pos_prsum(
  data,
  name = "su_y_nicvapeexp__pos_prsum",
  combine = TRUE,
  max_na = 2
)
```

## Format

vars_su_y_nicvapeexp\_\_pos is a character vector of all column names
used to compute summary score of `su_y_nicvapeexp__pos_prsum` and
`su_y_nicvapeexp__pos_nm`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character, Name of the new column to be created. Default is the name
  in description, but users can change it.

- combine:

  logical, If `TRUE` (default), the summary score will be appended to
  the input data frame. If `FALSE`, the summary score for each
  participant will be returned as a separate data frame. (Default: TRUE)

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

## Value

tbl. The input data frame with the summary score appended as a new
column.
