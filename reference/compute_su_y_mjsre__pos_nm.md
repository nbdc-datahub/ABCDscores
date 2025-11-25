# Compute "Marijuana Subjective Response and Effects \[Youth\] (Positive): Number missing"

Computes the summary score `su_y_mjsre__pos_nm` Marijuana Subjective
Response and Effects \[Youth\] (Positive): Number missing

- *Summarized variables:*

  - `su_y_mjsre__pos_001`

  - `su_y_mjsre__pos_002`

  - `su_y_mjsre__pos_003`

- *Excluded values:* none

## Usage

``` r
compute_su_y_mjsre__pos_nm(data, name = "su_y_mjsre__pos_nm", combine = TRUE)
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
