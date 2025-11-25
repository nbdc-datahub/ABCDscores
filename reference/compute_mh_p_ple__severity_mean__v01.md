# Compute "Life Events \[Parent\] (Severity): Mean - Version 1 (Year 3) \[Validation: No more than 6 events missing and no severity items missing or declined\]"

Computes the summary score `mh_p_ple__severity_mean__v01` Life Events
\[Parent\] (Severity): Mean - Version 1 (Year 3) \[Validation: No more
than 6 events missing and no severity items missing or declined\]

- *Summarized variables:*

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

  - `mh_p_ple__severity_026`

  - `mh_p_ple__severity_027`

  - `mh_p_ple__severity_028`

  - `mh_p_ple__severity_029`

  - `mh_p_ple__severity_030`

  - `mh_p_ple__severity_031`

- *Excluded values:*

  - 444

  - 777

  - 999

- *Validation criterion:* maximally 6 of 31 items missing

## Usage

``` r
compute_mh_p_ple__severity_mean__v01(
  data,
  name = "mh_p_ple__severity_mean__v01",
  events = "ses-03A",
  combine = TRUE,
  max_na = 6
)
```

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the new column to be created (Default: the name
  used in the ABCD data release).

- events:

  character vector. Event (session ID) to be used.

- combine:

  logical. If TRUE, the new column will be bound to the input data
  frame. If FALSE, the new column will be created as a new data frame.

- max_na:

  numeric, positive whole number. Number of missing items allowed
  (Default: 6).

## Value

tbl. The input data frame with the summary score appended as a new
column.
