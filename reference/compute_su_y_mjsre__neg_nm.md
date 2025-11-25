# Compute "Marijuana Subjective Response and Effects \[Youth\] (Negative): Number missing"

Computes the summary score `su_y_mjsre__neg_nm` Marijuana Subjective
Response and Effects \[Youth\] (Negative): Number missing

- *Summarized variables:*

  - `su_y_mjsre__neg_001`

  - `su_y_mjsre__neg_002`

  - `su_y_mjsre__neg_003`

  - `su_y_mjsre__neg_004`

  - `su_y_mjsre__neg_005`

  - `su_y_mjsre__neg_006`

  - `su_y_mjsre__neg_007`

  - `su_y_mjsre__neg_008`

- *Excluded values:* none

## Usage

``` r
compute_su_y_mjsre__neg_nm(data, name = "su_y_mjsre__neg_nm", combine = TRUE)
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

## Value

tbl. The input data frame with the summary score appended as a new
column.
