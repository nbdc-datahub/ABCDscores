# Computes episode-based daily sleep summary measures.

This function extends the standard sleep pipeline by grouping 30-second
sleep epochs into continuous sleep blocks based on a configurable gap
threshold, and redefining main sleep periods based on block duration.
Heart rate exclusion logic is applied both prior to and after block
construction to ensure consistency across raw and reconstructed sleep
structures.

## Usage

``` r
compute_fitbit_sleep_table_ext(
  data_activity,
  data_sleep_combined,
  data_daily,
  hr_low = 50,
  hr_high = NULL,
  hr_rep_day = 10,
  hr_rep_sleep = 30,
  bin_minutes = NULL,
  offset = "12:00",
  min_slp_minutes,
  main_duration = 180,
  gap = 90
)
```

## Arguments

- data_activity:

  tbl. Epoch-level activity data used to derive heart rate exclusion
  flags.

- data_sleep_combined:

  tbl. 30-second sleep epoch data containing sleep stage and timestamp
  information.

- data_daily:

  tbl. Daily Fitbit summary data including resting heart rate.

- hr_low:

  numeric. Lower threshold for valid heart rate values.

- hr_high:

  numeric or NULL. Optional upper threshold for valid heart rate values.

- hr_rep_day:

  numeric. Threshold (number of epochs) for repeated heart rate
  detection in daytime activity.

- hr_rep_sleep:

  numeric. Threshold (number of epochs) for repeated heart rate
  detection in sleep.

- bin_minutes:

  numeric. Number of minutes used to bin data.

- offset:

  character. Time-of-day cutoff used to define sleep-day boundaries.

- min_slp_minutes:

  numeric. Minimum number of sleep minutes required for a day to pass
  quality control. Used to create a `qc_Xmin` flag column in the output.

- main_duration:

  numeric. Minumum duration in minutes for a sleep episode to be qualify
  as a main sleep episode.

- gap:

  numeric. Maximum allowed gap (in minutes) between consecutive sleep
  epochs before a new sleep episode is defined.

## Value

tbl. A daily-level extended sleep summary table containing:

**Identifiers and time variables:**

- `participant_id`, `session_id`

- `wk`: Study week index

- `day`: Study day index

- `dt`: Sleep-aligned date

- `dt_day`: Day of week

- `dt_wknd`: Weekend indicator

**Sleep timing and block structure:**

- `dtt_start_bed`, `dtt_end_bed`

- `dtt_start_slp`, `dtt_end_slp`

**Sleep duration metrics:**

- `min_total_slp`, `min_asleep_slp`, `min_restless_slp`,
  `min_light_slp`, `min_deep_slp`, `min_rem_slp`, `min_nap_slp`

- `min_waso`, `min_wake`, `n_waso`

**Heart rate summaries by sleep stage:**

- `hrate_awake_slp`, `hrate_restless_slp`, `hrate_asleep_slp`

- `hrate_light_slp`, `hrate_deep_slp`, `hrate_rem_slp`

- `hrate_nap_slp`, `hrate_rest_fitb`

**Heart rate exclusion metrics:**

- `excl_min_total_slp`, `excl_min_lowhrate_slp`

- `excl_min_nohrate_slp`, `excl_min_highhrate_slp`

- `excl_min_repeathrate_slp`, `min_extra_nohrate_slp`

**Quality control flags:**

- `qc_300min`: Indicator for ≥300 minutes of sleep

- `flg_slp`: Flag for implausible sleep structure

- `flg_any`: Indicator for any valid sleep data

## Details

This extended pipeline differs from the standard sleep table by
introducing a episode-based reconstruction step. Sleep epochs are
grouped into continuous episodes using a configurable gap threshold, and
episode duration is used to define main sleep.

## Note

- `data_activity`: fitbit_raw_activity or fitbit_covid_raw_activity

- `data_sleep_combined`: fitbit_raw_sleep or fitbit_covid_raw_sleep

- `data_daily`: fitbit_raw_metrics or fitbit_covid_raw_metrics
