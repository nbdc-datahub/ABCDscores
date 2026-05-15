# Computes extended daily activity summaries

Computes all daily activity scores (extended).

## Usage

``` r
compute_fitbit_activity_table_ext(
  data_activity,
  data_daily = NULL,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = 1440,
  append_daily_fitbit_qc = TRUE,
  qc_threshold = 0.8,
  offset = "12:00",
  min_actv_minutes,
  main_duration,
  gap = 90
)
```

## Arguments

- data_activity:

  tbl. Data frame with activity data.

- data_daily:

  tbl. Data frame with daily Fitbit summary data.

- hr_low:

  numeric. Lower bound threshold for valid heart rate values.

- hr_high:

  numeric or NULL. Optional upper bound threshold.

- hr_rep_day:

  numeric. Threshold for identifying repeated HR.

- hr_rep_sleep:

  numeric. Threshold for identifying repeated HR.

- bin_minutes:

  numeric. Number of minutes used to bin data.

- append_daily_fitbit_qc:

  logical. If TRUE, add Fitbit-provided steps.

- qc_threshold:

  numeric, between 0 and 1. Minimum percentage of Fitbit step count that
  must be met by computed active step count for QC to pass.

- offset:

  character. Time of day (HH:MM) cutoff.

- min_actv_minutes:

  numeric. Minimum number of active minutes required for a day to pass
  quality control. Used to create a `{qc_Xmin}` flag column in the
  output.

- main_duration:

  numeric. Minimum duration in minutes.

- gap:

  numeric. Maximum allowed gap.

## Value

tbl. A daily-level extended activity summary.

## Note

- `data_activity`: fitbit_raw_activity or fitbit_covid_raw_activity

- `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics

## See also

[`compute_fitbit_activity_table()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_table.md)
