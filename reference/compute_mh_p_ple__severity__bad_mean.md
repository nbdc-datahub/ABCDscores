# Compute "Life Events \[Parent\] (Severity of Bad Events): Mean \[Validation: No more than 5 events missing and no experience/severity items missing or declined\]"

Computes the summary score `mh_p_ple__severity__bad_mean` Life Events
\[Parent\] (Severity of Bad Events): Mean \[Validation: No more than 5
events missing and no experience/severity items missing or declined\]

- *Summarized variables:*

  - `mh_p_ple__exp_001`

  - `mh_p_ple__exp_002`

  - `mh_p_ple__exp_003`

  - `mh_p_ple__exp_004`

  - `mh_p_ple__exp_005`

  - `mh_p_ple__exp_006`

  - `mh_p_ple__exp_007`

  - `mh_p_ple__exp_008`

  - `mh_p_ple__exp_009`

  - `mh_p_ple__exp_010`

  - `mh_p_ple__exp_011`

  - `mh_p_ple__exp_012`

  - `mh_p_ple__exp_013`

  - `mh_p_ple__exp_014`

  - `mh_p_ple__exp_015`

  - `mh_p_ple__exp_016`

  - `mh_p_ple__exp_017`

  - `mh_p_ple__exp_018`

  - `mh_p_ple__exp_019`

  - `mh_p_ple__exp_020`

  - `mh_p_ple__exp_021`

  - `mh_p_ple__exp_022`

  - `mh_p_ple__exp_023`

  - `mh_p_ple__exp_024`

  - `mh_p_ple__exp_025`

  - `mh_p_ple__severity_001`

  - `mh_p_ple__severity_002`

  - `mh_p_ple__severity_003`

  - `mh_p_ple__severity_004`

  - `mh_p_ple__severity_005`

  - `mh_p_ple__severity_006`

  - `mh_p_ple__severity_007`

  - `mh_p_ple__severity_008`

  - `mh_p_ple__severity_009`

  - `mh_p_ple__severity_010`

  - `mh_p_ple__severity_011`

  - `mh_p_ple__severity_012`

  - `mh_p_ple__severity_013`

  - `mh_p_ple__severity_014`

  - `mh_p_ple__severity_015`

  - `mh_p_ple__severity_016`

  - `mh_p_ple__severity_017`

  - `mh_p_ple__severity_018`

  - `mh_p_ple__severity_019`

  - `mh_p_ple__severity_020`

  - `mh_p_ple__severity_021`

  - `mh_p_ple__severity_022`

  - `mh_p_ple__severity_023`

  - `mh_p_ple__severity_024`

  - `mh_p_ple__severity_025`

- *Excluded values:*

  - 444

  - 777

  - 999

- *Validation criterion:* maximally 5 of 25 items missing

## Usage

``` r
compute_mh_p_ple__severity__bad_mean(
  data,
  name = "mh_p_ple__severity__bad_mean",
  combine = TRUE,
  max_na = 5
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

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 5).

## Value

tbl. The input data frame with the summary score appended as a new
column.
