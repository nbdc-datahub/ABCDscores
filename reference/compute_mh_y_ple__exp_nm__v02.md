# Compute "Life Events \[Youth\] (Experience): Number missing - Version 2 (Year 4 and Year 5)"

Computes the summary score `mh_y_ple__exp_nm__v02` Life Events \[Youth\]
(Experience): Number missing - Version 2 (Year 4 and Year 5)

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

  - `mh_y_ple__exp_026`

  - `mh_y_ple__exp_027`

  - `mh_y_ple__exp_028`

  - `mh_y_ple__exp_029`

  - `mh_y_ple__exp_030`

  - `mh_y_ple__exp_031`

  - `mh_y_ple__exp_032`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_y_ple__exp_nm__v02(
  data,
  name = "mh_y_ple__exp_nm__v02",
  events = c("ses-04A", "ses-05A"),
  combine = TRUE
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

## Value

tbl. The input data frame with the summary score appended as a new
column.
