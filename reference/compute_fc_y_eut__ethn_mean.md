# Compute "Experiences with Unfair Treatment \[Youth\] (Ethnicity): Mean"

Computes the summary score `fc_y_eut__ethn_mean` (Experiences with
Unfair Treatment \[Youth\] (Ethnicity): Mean)

- *Summarized variables:*

  - `fc_y_eut__ethn_001a`

  - `fc_y_eut__ethn_001b`

  - `fc_y_eut__ethn_001c`/`fc_y_eut__ethn_001c__v01`

  - `fc_y_eut__ethn_001d` (only from event "ses-06A" onwards)

  - `fc_y_eut__ethn_002`

  - `fc_y_eut__ethn_003a`/`fc_y_eut__ethn_003a__v01`

  - `fc_y_eut__ethn_003b`/`fc_y_eut__ethn_003b__v01`

  - `fc_y_eut__ethn_003c`/`fc_y_eut__ethn_003c__v01`

- *Excluded values:*

  - 444

  - 777

  - 999

- *Validation criterion:*

  - before event ses-06A: none of 7 items missing

  - starting at event ses-06A: maximally 1 of 8 items missing

## Usage

``` r
vars_fc_y_eut__ethn

compute_fc_y_eut__ethn_mean(data, name = "fc_y_eut__ethn_mean", combine = TRUE)
```

## Format

vars_fc_y_eut\_\_ethn is a character vector of all column names used to
compute summary score of `fc_y_eut__ethn`.

## Arguments

- data:

  tbl. Data frame containing the columns to be summarized.

- name:

  character. Name of the summary score. Default is the name in the
  description.

- combine:

  logical. If `TRUE`, the summary score is appended to the input data
  frame. If `FALSE`, the summary score is returned as a separate data
  frame. Default is `TRUE`.

## Value

tbl. The input data frame with the summary score appended as a new
column.
