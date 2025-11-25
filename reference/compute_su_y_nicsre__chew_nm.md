# Compute "Nicotine Subjective Response and Effects \[Youth\] (Positive and negative effects of first smokeless tobacco or chew use): Number missing"

Computes the summary score `su_y_nicsre__chew_nm` Nicotine Subjective
Response and Effects \[Youth\] (Positive and negative effects of first
smokeless tobacco or chew use): Number missing

- *Summarized variables:*

  - `su_y_nicsre__chew__pos_001`

  - `su_y_nicsre__chew__neg_001`

- *Excluded values:* none

## Usage

``` r
compute_su_y_nicsre__chew_nm(
  data,
  name = "su_y_nicsre__chew_nm",
  combine = TRUE
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

## Value

tbl. The input data frame with the summary score appended as a new
column.
