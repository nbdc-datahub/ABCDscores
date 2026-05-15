# Compute total minutes by sleep stage

Computes valid minutes spent in each sleep stage by offset date or by
specified time bins (e.g., 15-min, 30-min), not excluded by heart rate
criteria.

## Usage

``` r
compute_sleep_stage_min(data, bin_minutes = NULL)
```

## Arguments

- data:

  tbl. Dataframe for sleep data processed for exclusions, requires
  columns `is_slp`, `session_id`, `sleep_date` or `dtt`,
  `hrate_excluded`, and `stage`.

- bin_minutes:

  numeric, positive whole number. Optional number of minutes to bin data
  by. If NULL, defaults to sleep_date column created from `make_offset`
  function.

## Value

tbl. The input data frame with the following additional columns:

- `min_total_slp`: Total number of main sleep minutes

- `min_asleep_slp`: Total number of main sleep minutes in asleep stage.

- `min_restless_slp`: Total number of main sleep minutes in restless
  stage.

- `min_light_slp`: Total number of main sleep minutes in light stage.

- `min_deep_slp`: Total number of main sleep minutes in deep stage.

- `min_rem_slp`: Total number of main sleep minutes in REM stage.

- `min_nap_slp`: Total number of non-main sleep minutes.

- `min_wake`: Total number of main sleep minutes spent in wake stage.

- `start`: Start timestamp of the bin.

- `end`: End timestamp of the bin.

`start` and `end` are only present when `bin_minutes` is non-`NULL` and
not equal to `1440`.

## Note

input data should be output of `join_sleep30_and_exclusion()`. Input
data must be in 30-second epochs. `min_wake` includes minutes with stage
of "wake", "awake", "unknown", or NA (for activity minutes that become
sleep under extended framework).
