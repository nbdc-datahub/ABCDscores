# Compute "Life Events \[Parent\] (Events): Count - Version 4 (Starting at Year 7) \[Validation: No more than 4 missing or declined\]"

Computes the summary score `mh_p_ple_count__v04` Life Events \[Parent\]
(Events): Count - Version 4 (Starting at Year 7) \[Validation: No more
than 4 missing or declined\]

- *Summarized variables:*

  - `mh_p_ple_001`

  - `mh_p_ple_002`

  - `mh_p_ple_007`

  - `mh_p_ple_008`

  - `mh_p_ple_011`

  - `mh_p_ple_012`

  - `mh_p_ple_013`

  - `mh_p_ple_014`

  - `mh_p_ple_015`

  - `mh_p_ple_018`

  - `mh_p_ple_019`

  - `mh_p_ple_021`

  - `mh_p_ple_022`

  - `mh_p_ple_023`

  - `mh_p_ple_024`

  - `mh_p_ple_026`

  - `mh_p_ple_027`

  - `mh_p_ple_028`

  - `mh_p_ple_032`

  - `mh_p_ple_033`

- *Excluded values:*

  - 444

  - 777

  - 999

- *Validation criterion:* maximally 4 of 20 items missing

## Usage

``` r
vars_mh_p_ple__v04

compute_mh_p_ple_count__v04(
  data,
  name = "mh_p_ple_count__v04",
  events = "ses-07A",
  combine = TRUE,
  max_na = 4
)
```

## Format

vars_mh_p_ple\_\_v04 is a character vector of all column names used to
compute summary score of `mh_p_ple`.

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
  (Default: 4).

## Value

tbl. The input data frame with the summary score appended as a new
column.
