# Compute "Life Events \[Youth\] (Events): Number missing - Version 3 (Starting at Year 6)"

Computes the summary score `mh_y_ple_nm__v03` Life Events \[Youth\]
(Events): Number missing - Version 3 (Starting at Year 6)

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

  - `mh_y_ple_026`

  - `mh_y_ple_027`

  - `mh_y_ple_028`

  - `mh_y_ple_029`

  - `mh_y_ple_030`

  - `mh_y_ple_031`

  - `mh_y_ple_032`

  - `mh_y_ple_033`

  - `mh_y_ple_034`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_y_ple_nm__v03(
  data,
  name = "mh_y_ple_nm__v03",
  events = c("ses-06A", "ses-07A"),
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
