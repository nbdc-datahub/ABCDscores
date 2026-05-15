# Check parameters for compute_fitbit_activity_table

Validates all input parameters for
[`compute_fitbit_activity_table`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_table.md),
including data frame structure, required column presence, and numeric
parameter constraints.

## Usage

``` r
check_params_compute_fitbit_activity_table(
  data_activity,
  data_daily,
  hr_low,
  hr_high,
  hr_rep_day,
  hr_rep_sleep,
  bin_minutes,
  append_daily_fitbit_qc,
  qc_threshold,
  offset,
  min_actv_minutes
)
```

## Arguments

- data_activity:

  tbl. Data frame with `dtt` (timestamp), `hrate` (heart rate), `steps`,
  `intnst` (intensity), `mets` and `is_slp` (sleep flag) variables.

- data_daily:

  tbl. Daily-level Fitbit-generated summary data containing
  `hrate_rest_fitb` (resting heart rate) and optionally step counts
  (steps_fitb).

- hr_low:

  numeric. Lower bound threshold for valid heart rate values.

- hr_high:

  numeric or NULL. Optional upper bound threshold for valid heart rate
  values. If NULL, no upper threshold is applied.

- hr_rep_day:

  numeric. Threshold (number of epochs) for identifying repeated heart
  rate values during wake/activity periods.

- hr_rep_sleep:

  numeric. Threshold (number of epochs) for identifying repeated heart
  rate values during sleep periods.

- bin_minutes:

  numeric. Number of minutes used to bin activity data when computing
  intensity scores (e.g., 1440 for daily aggregation).

- append_daily_fitbit_qc:

  logical. If TRUE, add Fitbit-provided step count and QC measures.

- qc_threshold:

  numeric, between 0 and 1. Minimum percentage of Fitbit step count that
  must be met by computed active step count for QC to pass (Default:
  0.8).

- offset:

  character. Time of day (HH:MM) cutoff.

- min_actv_minutes:

  numeric. Minimum number of active minutes required for a day to pass
  quality control. Used to create a `{qc_Xmin}` flag column in the
  output.

## Value

NULL. Called for its side effects (parameter validation).
