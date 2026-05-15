# Computes heart rate based exclusions totals by time period

Computes heart rate based exclusions by day or by specified time bins.

## Usage

``` r
compute_fitbit_score_minutes_exclusion(data, bin_minutes)
```

## Arguments

- data:

  tbl. Data frame with exclusion flag columns `is_slp`, `session_id`,
  `dtt`, `hrate_excluded`, `hrate_low`, `hrate_hi` (optional),
  `hrate_no`, `hrate_repeat_actv`, and `hrate_repeat_slp`.

- bin_minutes:

  numeric, positive whole number. Number of minutes to bin data by.

## Value

tbl. The input data frame with the following additional columns:

- `excl_min_total_actv`: Total number of non-sleep minutes excluded by
  heart rate criteria.

- `excl_min_lowhrate_actv`: Total number of non-sleep minutes excluded
  by low heart rate criteria.

- `excl_min_highhrate_actv`: Total number of non-sleep minutes excluded
  by high heart rate criteria (if `hrate_hi` exists). Column is not
  created if `hrate_hi` does not exist.

- `excl_min_nohrate_actv`: Total number of non-sleep minutes excluded by
  missing heart rate criteria.

- `excl_min_repeathrate_actv`: Total number of non-sleep minutes
  excluded by repeat heart rate criteria.

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

- `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
  stamp of bin.

- `end`: If non-daily bin selected (i.e., != 1440 minutes), end time
  stamp of the bin.

## Note

- output of identify_hr_exclusions() or identify_hr_recovery();

- needs exclusion flags
