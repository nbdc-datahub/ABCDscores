# Compute "Life Events \[Youth\] (Events): Number missing"

Computes the summary score `mh_y_ple_nm` Life Events \[Youth\] (Events):
Number missing

- *Summarized variables:*

  - `mh_y_ple_001`

  - `mh_y_ple_002`

  - `mh_y_ple_003`

  - `mh_y_ple_004`

  - `mh_y_ple_005`

  - `mh_y_ple_006`

  - `mh_y_ple_007`

  - `mh_y_ple_008`

  - `mh_y_ple_009`

  - `mh_y_ple_010`

  - `mh_y_ple_011`

  - `mh_y_ple_012`

  - `mh_y_ple_013`

  - `mh_y_ple_014`

  - `mh_y_ple_015`

  - `mh_y_ple_016`

  - `mh_y_ple_017`

  - `mh_y_ple_018`

  - `mh_y_ple_019`

  - `mh_y_ple_020`

  - `mh_y_ple_021`

  - `mh_y_ple_022`

  - `mh_y_ple_023`

  - `mh_y_ple_024`

  - `mh_y_ple_025`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_y_ple_nm(data, name = "mh_y_ple_nm", combine = TRUE)
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
