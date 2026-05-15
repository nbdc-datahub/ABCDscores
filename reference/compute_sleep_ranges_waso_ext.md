# Computes sleep timing and WASO metrics

Computes sleep timing and WASO metrics at the sleep-block level,
incorporating block structure constraints to ensure sleep ranges are
only calculated when a single valid main sleep block is present.

This function extends
[`compute_sleep_ranges_waso()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_sleep_ranges_waso.md)
by restricting sleep range calculations to nights with exactly one valid
sleep block, improving robustness in fragmented sleep recordings.

## Usage

``` r
compute_sleep_ranges_waso_ext(data_blocks, data_counts, bin_minutes)
```

## Arguments

- data_blocks:

  tbl. Output from
  [`add_sleep_flags()`](https://software.nbdc-datahub.org/ABCDscores/reference/add_sleep_flags.md),
  containing sleep epoch data with block assignments and sleep stage
  information.

- data_counts:

  tbl. Output from
  [`compute_block_counts()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_block_counts.md),
  containing the number of valid main sleep blocks per
  participant-night.

- bin_minutes:

  numeric. Number of minutes to bin data by.

## Value

tbl. A participant-night level summary containing:

- `dtt_start_slp`: Sleep onset time (if a single valid block exists).

- `dtt_end_slp`: Sleep offset time (based on last wake transition or
  block end).

- `dtt_start_bed`: Start of sleep recording interval.

- `dtt_end_bed`: End of sleep recording interval.

- `n_waso`: Number of wake-after-sleep-onset episodes (adjusted for
  block structure).

- `min_waso`: Total wake-after-sleep-onset duration in minutes (30-sec
  epochs).

## Details

Sleep metrics are only computed when exactly one valid main sleep block
is present for a given participant-night. If multiple blocks exist,
sleep timing variables are set to `NA` to avoid ambiguity.

Wake episodes are identified using run-length encoding of cleaned sleep
stages, where `"awake"` and `"wake"` are treated as wake states and
missing values are recoded as `"awake"`.
