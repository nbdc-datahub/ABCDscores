# Compute "Life Events \[Youth\] (Experience): Number missing"

Computes the summary score `mh_y_ple__exp_nm` Life Events \[Youth\]
(Experience): Number missing

- *Summarized variables:*

  - `mh_y_ple__exp_001`

  - `mh_y_ple__exp_002`

  - `mh_y_ple__exp_003`

  - `mh_y_ple__exp_004`

  - `mh_y_ple__exp_005`

  - `mh_y_ple__exp_006`

  - `mh_y_ple__exp_007`

  - `mh_y_ple__exp_008`

  - `mh_y_ple__exp_009`

  - `mh_y_ple__exp_010`

  - `mh_y_ple__exp_011`

  - `mh_y_ple__exp_012`

  - `mh_y_ple__exp_013`

  - `mh_y_ple__exp_014`

  - `mh_y_ple__exp_015`

  - `mh_y_ple__exp_016`

  - `mh_y_ple__exp_017`

  - `mh_y_ple__exp_018`

  - `mh_y_ple__exp_019`

  - `mh_y_ple__exp_020`

  - `mh_y_ple__exp_021`

  - `mh_y_ple__exp_022`

  - `mh_y_ple__exp_023`

  - `mh_y_ple__exp_024`

  - `mh_y_ple__exp_025`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_y_ple__exp_nm(data, name = "mh_y_ple__exp_nm", combine = TRUE)
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
