# Compute sleep timing and WASO Metrics from Epoch-Level Data

Computes sleep onset, sleep offset, and WASO (wake after sleep onset)
metrics from 30-second sleep epoch data.

This function summarizes nightly sleep timing and wake fragmentation by
identifying transitions in sleep stages and calculating
wake-after-sleep-onset characteristics.

## Usage

``` r
compute_sleep_ranges_waso(sleep_offset, bin_minutes)
```

## Arguments

- sleep_offset:

  tbl. Sleep epoch-level dataset containing at minimum:
  `participant_id`, `session_id`, `sleep_date`, `dtt`, `stage`,
  `hrate_excluded`, and `main_slp`.

- bin_minutes:

  numeric. Number of minutes to bin data by.

## Value

tbl. A participant-night level summary containing:

- `dtt_start_slp`: First detected sleep epoch (light/deep/rem/asleep).

- `dtt_end_slp`: End of sleep period (last awake onset or end of bed).

- `dtt_start_bed`: Start of recording interval for the sleep period.

- `dtt_end_bed`: End of recording interval for the sleep period.

- `n_waso`: Number of wake-after-sleep-onset (WASO) episodes.

- `min_waso`: Total WASO duration (in minutes, 30-sec epoch units).

## Details

Sleep stages labeled as `"awake"` or `"wake"` are treated as wake
periods. Missing stages are also recoded as `"awake"` to ensure
consistency in wake detection. Wake episodes at the beginning and end of
the sleep window are excluded from WASO calculations.

## Note

input data should be output of `join_sleep30_and_exclusion()`. Input
data must be in 30-second epochs. `min_wake` includes minutes with stage
of "wake", "awake", "unknown", or NA (for activity minutes that become
sleep under extended framework).

- data input: sleep epoch-level data with sleep stage and exclusion
  flags
