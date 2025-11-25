# Compute "Life Events \[Parent\] (Severity): Number missing - Version 4 (Starting at Year 7)"

Computes the summary score `mh_p_ple__severity_nm__v04` Life Events
\[Parent\] (Severity): Number missing - Version 4 (Starting at Year 7)

- *Summarized variables:*

  - `mh_p_ple__severity_001`

  - `mh_p_ple__severity_002`

  - `mh_p_ple__severity_007`

  - `mh_p_ple__severity_008`

  - `mh_p_ple__severity_011`

  - `mh_p_ple__severity_012`

  - `mh_p_ple__severity_013`

  - `mh_p_ple__severity_014`

  - `mh_p_ple__severity_015`

  - `mh_p_ple__severity_018`

  - `mh_p_ple__severity_019`

  - `mh_p_ple__severity_021`

  - `mh_p_ple__severity_022`

  - `mh_p_ple__severity_023`

  - `mh_p_ple__severity_024`

  - `mh_p_ple__severity_026`

  - `mh_p_ple__severity_027`

  - `mh_p_ple__severity_028`

  - `mh_p_ple__severity_032`

  - `mh_p_ple__severity_033`

- *Excluded values:*

  - 444

  - 777

  - 999

## Usage

``` r
compute_mh_p_ple__severity_nm__v04(
  data,
  name = "mh_p_ple__severity_nm__v04",
  events = "ses-07A",
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
