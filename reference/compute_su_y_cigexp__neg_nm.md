# Compute "Cigarette Expectancies (ASCQ) \[Youth\] (Strength of negative expectancies): Number missing"

Computes the summary score `su_y_cigexp__neg_nm` Cigarette Expectancies
(ASCQ) \[Youth\] (Strength of negative expectancies): Number missing

- *Summarized variables:*

  - `su_y_cigexp__neg_001`

  - `su_y_cigexp__neg_002`

- *Excluded values:* none

## Usage

``` r
compute_su_y_cigexp__neg_nm(data, name = "su_y_cigexp__neg_nm", combine = TRUE)
```

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

## Value

tbl. The input data frame with the summary score appended as a new
column.

## See also

[`compute_su_y_cigexp__neg_prsum()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_su_y_cigexp__neg_prsum.md)
