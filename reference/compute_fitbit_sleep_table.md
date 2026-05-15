# Compute daily sleep summaries

Processes Fitbit minute-level data to generate daily sleep summary
scores. This function integrates multiple processing steps, including
heart rate-based exclusions and calculation of sleep measures,
aggregated at the day level.

## Usage

``` r
compute_fitbit_sleep_table(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = NULL,
  offset = "12:00",
  min_slp_minutes = 300
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

tbl. A daily-level summarized data frame with the following components:

**Identifiers and time variables:**

- `participant_id`, `session_id`

- `wk`: Study week index

- `day`: Study day index

- `dt`: Calendar date

- `dt_day`: Day of week (labeled)

- `dt_wknd`: Indicator for weekend days

**Sleep timing measures:**

- `dtt_start_bed`, `dtt_end_bed`: Bed interval start and end times

- `dtt_start_slp`, `dtt_end_slp`: Sleep interval start and end times

**Sleep duration measures:**

- `min_total_slp`: Total sleep duration

- `min_asleep_slp`, `min_restless_slp`, `min_light_slp`, `min_deep_slp`,
  `min_rem_slp`: Stage-specific sleep durations

- `min_nap_slp`: Nap sleep duration

- `min_wake`: Wake minutes during sleep intervals

- `min_waso`: Wake after sleep onset (WASO)

- `n_waso`: Number of WASO episodes

**Heart rate summaries by sleep stage:**

- `hrate_awake_slp`, `hrate_restless_slp`, `hrate_asleep_slp`

- `hrate_light_slp`, `hrate_deep_slp`, `hrate_rem_slp`

- `hrate_nap_slp`: Mean heart rate during nap sleep

- `hrate_rest_fitb`: Daily resting heart rate from Fitbit

**Heart rate exclusion measures:**

- `excl_min_total_slp`: Total excluded sleep minutes

- `excl_min_lowhrate_slp`: Minutes excluded due to low heart rate

- `excl_min_nohrate_slp`: Minutes excluded due to missing heart rate

- `excl_min_highhrate_slp`: Minutes excluded due to high heart rate

- `excl_min_repeathrate_slp`: Minutes excluded due to repeated heart
  rate

- `min_extra_nohrate_slp`: Additional plausible sleep minutes excluded

**Quality control and flags:**

- `qc_300min`: Indicator for \>= 300 minutes of valid sleep

- `flg_slp`: Indicator for implausible sleep structure

- `flg_any`: Indicator that any sleep data are present

## Note

`flg_slp`, sleep timing and WASO variables are only calculated when
`bin_minutes` is NULL. Calculations depend on offset dates and cannot
operate on binned intervals. Returns an empty columns otherwise.

- `data_activity`: fitbit_raw_activity or fitbit_covid_raw_activity

- `data_sleep_combined`: fitbit_raw_sleep or fitbit_covid_raw_sleep

- `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics
