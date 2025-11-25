# Compute "Screen Time \[Youth\] (Weekend): Number missing"

Computes the summary score `nt_y_stq__screen__wknd_nm` Screen Time
\[Youth\] (Weekend): Number missing

- *Summarized variables:*

  - `nt_y_stq__screen__wknd_001`

  - `nt_y_stq__screen__wknd_002`

  - `nt_y_stq__screen__wknd_003`

  - `nt_y_stq__screen__wknd_004`

  - `nt_y_stq__screen__wknd_005`

  - `nt_y_stq__screen__wknd_006`

  - `nt_y_stq__screen__wknd__hr_001`

  - `nt_y_stq__screen__wknd__min_001`

  - `nt_y_stq__screen__wknd__hr_001__v01`

  - `nt_y_stq__screen__wknd__min_001__v01`

  - `nt_y_stq__screen__wknd__hr_002`

  - `nt_y_stq__screen__wknd__min_002`

  - `nt_y_stq__screen__wknd__hr_003`

  - `nt_y_stq__screen__wknd__min_003`

  - `nt_y_stq__screen__wknd__hr_004`

  - `nt_y_stq__screen__wknd__min_004`

  - `nt_y_stq__screen__wknd__hr_005`

  - `nt_y_stq__screen__wknd__min_005`

  - `nt_y_stq__screen__wknd__hr_006`

  - `nt_y_stq__screen__wknd__min_006`

  - `nt_y_stq__screen__wknd__hr_007`

  - `nt_y_stq__screen__wknd__min_007`

  - `nt_y_stq__screen__wknd__hr_008`

  - `nt_y_stq__screen__wknd__min_008`

  - `nt_y_stq__screen__wknd__hr_009`

  - `nt_y_stq__screen__wknd__min_009`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
compute_nt_y_stq__screen__wknd_nm(
  data,
  name = "nt_y_stq__screen__wknd_nm",
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
