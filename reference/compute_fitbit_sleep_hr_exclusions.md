# Compute total minutes excluded by heart rate criteria

Computes heart rate based exclusions by sleep offset or by specified
time bins (e.g., 15-min, 30-min, 60-min).

## Usage

``` r
compute_fitbit_sleep_hr_exclusions(data, bin_minutes = NULL)
```

## Arguments

- data:

  tbl. Data frame heart rate columns `is_slp`, `session_id`, `dtt`,
  `hrate_excluded`, `hrate_low`, `hrate_hi` (optional), `hrate_no`,
  `hrate_repeat_actv`, and `hrate_repeat_slp` in 30-second resolution.

- bin_minutes:

  numeric, positive whole number. Number of minutes to bin data by. If
  NULL, defaults to sleep_date column created from `make_offset`
  function.

## Value

tbl. The input data frame with the following additional columns:

- `excl_min_total_slp`: Total number of sleep minutes excluded by heart
  rate criteria.

- `excl_min_lowhrate_slp`: Total number of sleep minutes excluded by low
  heart rate criteria.

- `excl_min_highhrate_slp`: Total number of sleep minutes excluded by
  high heart rate criteria (if `hrate_hi` exists). Column is not created
  if `hrate_hi` does not exist.

- `excl_min_nohrate_slp`: Total number of sleep minutes excluded by
  missing heart rate criteria.

- `excl_min_repeathrate_slp`: Total number of sleep minutes excluded by
  repeat heart rate criteria.

- `min_extra_nohrate_slp`: Total number of minutes of plausible sleep
  minutes but excluded for missing heart rate.

- `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
  stamp of bin.

- `end`: If non-daily bin selected (i.e., != 1440 minutes), end time
  stamp of the bin.

## Note

input data should be output of `join_sleep30_and_exclusion()`. Input
data must be in 30-second epochs. `min_wake` includes minutes with stage
of "wake", "awake", "unknown", or NA (for activity minutes that become
sleep under extended framework).

- data input: exclusion data in offset format
