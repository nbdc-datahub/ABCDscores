# Compute "Life Events \[Parent\] (Events): Number missing"

Computes the summary score `mh_p_ple_nm` Life Events \[Parent\]
(Events): Number missing

- *Summarized variables:*

  - `mh_p_ple_001`

  - `mh_p_ple_002`

  - `mh_p_ple_003`

  - `mh_p_ple_004`

  - `mh_p_ple_005`

  - `mh_p_ple_006`

  - `mh_p_ple_007`

  - `mh_p_ple_008`

  - `mh_p_ple_009`

  - `mh_p_ple_010`

  - `mh_p_ple_011`

  - `mh_p_ple_012`

  - `mh_p_ple_013`

  - `mh_p_ple_014`

  - `mh_p_ple_015`

  - `mh_p_ple_016`

  - `mh_p_ple_017`

  - `mh_p_ple_018`

  - `mh_p_ple_019`

  - `mh_p_ple_020`

  - `mh_p_ple_021`

  - `mh_p_ple_022`

  - `mh_p_ple_023`

  - `mh_p_ple_024`

  - `mh_p_ple_025`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_p_ple_nm(data, name = "mh_p_ple_nm", combine = TRUE)
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
