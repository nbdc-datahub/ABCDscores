# Check parameters for compute_fitbit_sleep_table

Validates all input parameters for
[`compute_fitbit_sleep_table`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_table.md),
including data frame structure, required column presence, and numeric
parameter constraints.

## Usage

``` r
check_params_compute_fitbit_sleep_table(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low,
  hr_high,
  hr_rep_day,
  hr_rep_sleep,
  bin_minutes,
  offset,
  min_slp_minutes
)
```

## Arguments

- data_activity:

  tbl. Data frame with the following columns with minute-level epoch
  data with the following columns:

  - `participant_id`: Participant identifier

  - `session_id`: Session identifier

  - `dtt`: POSIXct epoch timestamp

  - `dtt` POSIXct epoch timestamp.

- data_sleep_combined:

  tbl. Data frame with the following columns in 30-second epoch level
  with the following columns:

  - `participant_id`: Participant identifier

  - `session_id`: Session identifier

  - `dtt`: POSIXct epoch timestamp

  - `stage`: Sleep stage classification (e.g., `"light"`, `"deep"`,
    `"rem"`, `"awake"`).

  - `main_slp`: logical. Indicates if epoch is associated with 'main'
    sleep.

- data_daily:

  tbl. Daily-level Fitbit-generated summary data containing:

  - `participant_id`: Participant identifier

  - `session_id`: Session identifier

  - `dt`: Calendar date

  - `hrate_rest_fitb`: Fitbit-reported resting heart rate in beats per
    minute.

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
  intensity scores (e.g., 1440 for daily aggregation). Default is NULL.
  When NULL, it uses `offset` to split days, which by default is `12:00`
  (noon).

- offset:

  character. Time of day (HH:MM) used as the cutoff for defining the
  sleep day. Timestamps occuring after this time are assigned to the
  next day.

- min_slp_minutes:

  numeric. Minimum number of sleep minutes required for a day to pass
  quality control. Used to create a `qc_Xmin` flag column in the output.

## Value

NULL. Called for its side effects (parameter validation).
