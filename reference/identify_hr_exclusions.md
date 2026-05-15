# Identify heart rate based exclusions

Flags implausible or poor-quality heart rate observations based on
physiologic thresholds, missingness and repeated values.

## Usage

``` r
identify_hr_exclusions(data, hr_low, hr_high = NULL, hr_rep_day, hr_rep_sleep)
```

## Arguments

- data:

  tbl. Data frame with the following columns with minute-level epoch
  data with the following columns:

  - `participant_id`: Participant identifier

  - `session_id`: Session identifier

  - `dtt`: POSIXct epoch timestamp

  - `dtt` POSIXct epoch timestamp.

- hr_low:

  numeric, positive whole number. Lower bound for plausible heart rate
  (Default: 50 bpm)

- hr_high:

  numeric, positive whole number. Upper bound for plausible heart rate.
  If NULL, no upper bound is applied (Default: NULL)

- hr_rep_day:

  numeric, positive whole number. Number of consecutive missing heart
  rate values allowed during non-sleep minutes (Default: 10).

- hr_rep_sleep:

  numeric, positive whole number. Number of consecutive missing heart
  rate values allowed during sleep minutes (Default: 30).

## Value

tbl. The input data frame with the following additional columns:

- `hrate_low`: TRUE if heart rate is below `hr_low` threshold, FALSE
  otherwise.

- `hrate_hi`: TRUE if heart rate is above `hr_high` threshold (if
  `hr_high` is not NULL), FALSE otherwise. Column is not created if
  `hr_high` is NULL.

- `hrate_no`: TRUE if heart rate is missing, FALSE otherwise.

- `hrate_repeat_actv`: TRUE if there are more than `hr_rep_day`
  consecutive identical heart rate values during non-sleep minutes,
  FALSE otherwise.

- `hrate_repeat_slp`: TRUE if there are more than `hr_rep_sleep`
  consecutive identical heart rate values during sleep minutes, FALSE
  otherwise.

- `hrate_excluded`: TRUE if any above exclusion criteria are met, FALSE
  otherwise.

## Details

Missing values are handled using a bounded approach. When a consecutive
sequence of missing values are bounded by identical values, exclusions
are flagged as repeat exclusions if the length of sequence meets repeat
threshold parameters.

## Note

`data` is either `fitbit_raw_activity` or `fitbit_covid_raw_activity`
downloaded from LASSO.
