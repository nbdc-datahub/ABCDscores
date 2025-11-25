# Compute "Life Events \[Youth\] (Severity): Number missing"

Computes the summary score `mh_y_ple__severity_nm` Life Events \[Youth\]
(Severity): Number missing

- *Summarized variables:*

  - `mh_y_ple__severity_001`

  - `mh_y_ple__severity_002`

  - `mh_y_ple__severity_003`

  - `mh_y_ple__severity_004`

  - `mh_y_ple__severity_005`

  - `mh_y_ple__severity_006`

  - `mh_y_ple__severity_007`

  - `mh_y_ple__severity_008`

  - `mh_y_ple__severity_009`

  - `mh_y_ple__severity_010`

  - `mh_y_ple__severity_011`

  - `mh_y_ple__severity_012`

  - `mh_y_ple__severity_013`

  - `mh_y_ple__severity_014`

  - `mh_y_ple__severity_015`

  - `mh_y_ple__severity_016`

  - `mh_y_ple__severity_017`

  - `mh_y_ple__severity_018`

  - `mh_y_ple__severity_019`

  - `mh_y_ple__severity_020`

  - `mh_y_ple__severity_021`

  - `mh_y_ple__severity_022`

  - `mh_y_ple__severity_023`

  - `mh_y_ple__severity_024`

  - `mh_y_ple__severity_025`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_y_ple__severity_nm(
  data,
  name = "mh_y_ple__severity_nm",
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
