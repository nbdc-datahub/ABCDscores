# Computes steps summary scores by day or by specified time bins

Computes steps summary scores by day or by specified time bins (e.g.,
15-min, 30-min, 60-min), with optional integration of daily step count
QC from raw metrics.

## Usage

``` r
compute_fitbit_score_steps(
  data_exclusions,
  bin_minutes = 1440,
  data_daily_qc,
  qc_threshold,
  append_daily_fitbit_qc = FALSE
)
```

## Arguments

- data_exclusions:

  tbl. Data frame with `hrate_excluded` flag.

- bin_minutes:

  numeric, positive whole number. Number of minutes to bin data by.

- data_daily_qc:

  tbl. Data frame with Fitbit provided daily step count.

- qc_threshold:

  numeric, between 0 and 1. Minimum percentage of Fitbit step count that
  must be met by computed active step count for QC to pass.

- append_daily_fitbit_qc:

  logical. If TRUE, appends daily Fitbit step count and QC results to
  output (Default: FALSE). If TRUE, `data_daily_qc` and `qc_threshold`
  must be provided and `bin_minutes` must be NULL.

## Value

tbl. The input data frame with the following additional columns:

- `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
  stamp of bin.

- `end`: If non-daily bin selected (i.e., != 1440 minutes), end time
  stamp of the bin.

- `steps_total`: Total steps after excluding minutes with invalid heart
  rate.

- `steps_actv`: Total steps during non-sleep, non-excluded minutes.

- `steps`: Total steps, regardless of heart rate exclusions.

- `steps_fitb`:

- `prct_steps_fitb`: percent accordance between steps_actv and Fitbit
  calculated daily step count, if append_daily_fitbit_qc = TRUE.

- `qc_steps`: percent accordance between steps_actv and Fitbit
  calculated daily step count \>= selected qc_threshold.

@note

- data_exclusions input: output of identify_hr_exclusions() or
  identify_hr_recovery(); needs exclusion flags

- data_daily_qc input: fitbit_raw_metrics raw dataset
