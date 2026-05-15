# Computes Daily Activity Summaries

Pipeline wrapper that processes Fitbit minute-level activity data into a
daily summary table. Applies heart rate-based exclusions and recovery
identification, then aggregates minute totals, exclusion summaries, step
counts, intensity scores, and sleep presence into a single day-level
data frame. Optionally appends Fitbit-generated daily QC measures.

## Usage

``` r
compute_fitbit_activity_table(
  data_activity,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = 1440,
  append_daily_fitbit_qc,
  qc_threshold = 0.8,
  offset = "12:00",
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

tbl. A daily-level summarized data frame with the following components:

**Identifiers and time variables:**

- `participant_id`, `session_id`

- `wk`: Study week index

- `day`: Study day index

- `dt`: Calendar date

- `dt_day`: Day of week (labeled)

- `dt_wknd`: Indicator for weekend days

**Activity and sleep measures:**

- `min_total`: Total valid minutes

- `min_actv`: Active (non-sleep) minutes

- `min_slp`: Sleep minutes

- `min_nap_slp`: Nap sleep minutes

**Step count measures:**

- `steps_total`: Total steps after exclusions

- `steps_actv`: Steps during active minutes after exclusions

- `steps`: Total steps before exclusions

- `steps_fitb`: Fitbit-reported daily steps

**Energy expenditure and intensity-based activity measures:**

- `mets`: Mean METs

- `mets_actv`: Mean METs during active minutes

- `min_intnst_*`: Minutes spent in sedentary, light, moderate, and
  vigorous activity (total and active-only variants)

**Heart rate exclusion summaries:**

- `excl_min_*`: Minutes excluded due to heart rate criteria (low, high,
  missing, repeated) for both activity and sleep domains

**Heart rate and QC metrics:**

- `hrate_rest_fitb`: Resting heart rate (Fitbit daily summary)

- `qc_600min`: Indicator for \>= 600 valid active minutes

- `qc_steps`: Indicator for valid step counts based on Fitbit comparison

- `pcnt_steps_fitb`: Proportion of calculated steps relative to
  Fitbit-reported steps

**Flags:**

- `flg_30sec`: Indicator that valid 30-second sleep data exists for the
  day

- `flg_any`: Indicator that any valid data exists for the day
