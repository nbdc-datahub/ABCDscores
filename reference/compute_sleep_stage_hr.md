# Compute daily average heart rate

Calculates mean heart rate within each sleep stage, either by sleep date
or aggregated into fixed-width time bins (e.g., 15, 30, or 60 minutes).
Epochs flagged by heart rate criteria are included.

## Usage

``` r
compute_sleep_stage_hr(data, bin_minutes = NULL)
```

## Arguments

- data:

  tbl. Data frame heart rate columns `is_slp`, `session_id`,
  `sleep_date` or `dtt`, `hrate`, `hrate_excluded`, `stage`.

- bin_minutes:

  numeric, positive whole number. Optional number of minutes to bin data
  by. If NULL, defaults to sleep_date column created from `make_offset`
  function.

## Value

tbl. The input data frame with the following additional columns:

- `hrate_awake_slp`: Mean heart rate during wake stage, includes awake
  and NULL stage minutes from extended framework.

- `hrate_restless_slp`: Mean heart rate during 'restless' stage

- `hrate_asleep_slp`: Mean heart rate during 'asleep' stage

- `hrate_light_slp`: Mean heart rate during 'light' stage

- `hrate_deep_slp`: Mean heart rate during 'deep' stage.

- `hrate_rem_slp`: Mean heart rate during 'rem' stage.

- `start`: Start timestamp of the bin.

- `end`: End timestamp of the bin.

`start` and `end` are only present when `bin_minutes` is non-`NULL` and
not equal to `1440`.

## Note

input data should be output of `join_sleep30_and_exclusion()`. Input
data must be in 30-second epochs. `min_wake` includes minutes with stage
of "wake", "awake", "unknown", or NA (for activity minutes that become
sleep under extended framework). All `hrate_` columns are rounded to one
decimal place.
