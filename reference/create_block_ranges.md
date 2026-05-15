# Identify contiguous sleep episodes.

Identifies contiguous sleep episodes based on temporal gaps between
valid sleep minutes. A new block is begins whenever the time difference
between consecutive sleep records exceeds specified threshold. Function
provides start and end times for each block and indicates whether they
contain 'main' sleep.

## Usage

``` r
create_block_ranges(exclusions_df, offset = "12:00", gap)
```

## Arguments

- exclusions_df:

  tbl. Data frame with columns `is_slp`, `dtt`, `hrate_excluded`, and
  `main_slp`.

- offset:

  character. Time of day `"HH:MM"` used as the cutoff for defining the
  sleep day. Timestamps occuring after this time are assigned to the
  next day.

- gap:

  numeric. Maximum allowed gap.

## Value

tbl. A dataframe summarized at the sleep-block level, with the following
columns:

- `participant_id`: participant identifier

- `block_id`: identifier for each sleep block

- `block_start`: Start timestamp of each continous sleep block.

- `block_end`: End timestamp of each continous sleep block.

- `main_block`: Logical indicator of whether the block contains any main
  sleep.

- `duration_min`: Duration of each sleep block in minutes.

- `sleep_date`: Sleep-aligned date based on specified `offset`.

## Note

`exclusions_df`: output of identify_hr_exclusions() or
identify_hr_recovery(); needs exclusion flags function is specific to
extended framework input: offset sleep data with exclusion flags
