# Compute "Youth Screen Time \[Parent\] (Problematic Media Use): Mean \[Validation: No more than 1 missing or declined\]"

Computes the summary score `nt_p_yst__pmum_mean` Youth Screen Time
\[Parent\] (Problematic Media Use): Mean \[Validation: No more than 1
missing or declined\]

- *Summarized variables:*

  - `nt_p_yst__pmum_001`

  - `nt_p_yst__pmum_002`

  - `nt_p_yst__pmum_003`

  - `nt_p_yst__pmum_004`

  - `nt_p_yst__pmum_005`

  - `nt_p_yst__pmum_006`

  - `nt_p_yst__pmum_007`

  - `nt_p_yst__pmum_008`

  - `nt_p_yst__pmum_009`

- *Excluded values:*

  - 777

  - 999

## Usage

``` r
vars_nt_p_yst__pmum

compute_nt_p_yst__pmum_mean(
  data,
  name = "nt_p_yst__pmum_mean",
  max_na = 1,
  combine = TRUE
)
```

## Format

vars_nt_p_yst\_\_pmum is a character vector of all column names used to
compute summary score of `nt_p_yst__pmum_mean`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 1).

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

## Value

tbl. The input data frame with the summary score appended as a new
column.
