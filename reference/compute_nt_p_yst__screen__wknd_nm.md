# Compute "Youth Screen Time \[Parent\] (Weekend): Number missing"

Computes the summary score `nt_p_yst__screen__wknd_nm` Youth Screen Time
\[Parent\] (Weekend): Number missing

- *Summarized variables:*

  - `nt_p_yst__wknd__hr_001`

  - `nt_p_yst__wknd__min_001`

  - `nt_p_yst__wknd__min_001__v01`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_nt_p_yst__screen__wknd_nm(
  data,
  name = "nt_p_yst__screen__wknd_nm",
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
