# Compute count of valid main sleep episodes per participant-day

This function evaluates sleep blocks and identifies whether each sleep
day contains a single valid main sleep episode based on a minimum
duration threshold.

## Usage

``` r
compute_block_counts(data, main_dur)
```

## Arguments

- data:

  tbl. Sleep block-level dataset containing at minimum:
  `participant_id`, `sleep_date`, `main_block`, and `duration_min`.

- main_dur:

  numeric. Minimum block duration (in minutes) required for a sleep
  block to be considered a main sleep period.

## Value

tbl. A summarized data frame at the participant-day level with:

- `n`: Number of main sleep blocks meeting the minimum duration
  threshold.

- `single_block`: Logical indicator of whether exactly one valid main
  sleep episode is present.

## Details

The function is used to assess sleep fragmentation at the block level by
counting how many blocks satisfy both the `main_block` flag and the
minimum duration requirement. This is commonly used in extended sleep
pipelines to distinguish consolidated sleep from fragmented sleep
patterns.
