# Append Sleep Episode Metadata to Epoch-Level Data

Joins sleep block metadata onto epoch-level data via a temporal overlap
join, then derives two flags: a revised `is_slp` indicator and a
`main_slp` indicator. Epochs are considered sleep if they fall within a
detected sleep block or were originally flagged as sleep during a
heart-rate-excluded night.

## Usage

``` r
add_sleep_flags(data, blocks, main_duration)
```

## Arguments

- data:

  tbl. Data frame with epoch-level sleep data that contains

  - `participant_id`: Participant identifier.

  - `dtt`: POSIXct epoch timestamp.

  - `is_slp`: Logical. Original sleep flag prior to block-based
    revision.

  - `hr_exc_night`: Logical. Indicates whether the epoch occurred on a
    heart-rate-excluded night.

- blocks:

  tbl. A `tbl` or `data.frame` of sleep block ranges, typically the
  output of
  [`create_block_ranges()`](https://software.nbdc-datahub.org/ABCDscores/reference/create_block_ranges.md).
  Must contain `participant_id`, `block_start`, `block_end`,
  `main_block`, and `duration_min`.

- main_duration:

  Positive numeric. Minimum duration in minutes required for a block to
  be considered main sleep. Blocks shorter than this threshold will not
  be classified as main sleep even if main block contains main sleep.

## Value

The input `data` with all columns from `blocks` appended via temporal
overlap join, plus two derived columns:

- `is_slp`: Revised sleep flag, overwriting the original. `TRUE` if the
  epoch falls within a detected sleep block or was originally flagged as
  sleep on a heart-rate-excluded night.

- `main_slp`: `TRUE` if the epoch's block has `main_block == TRUE` and
  `duration_min >= main_duration`. `FALSE` otherwise, including
  unmatched epochs.

## Note

`is_slp` and `main_slp` are present in `data` on entry but are both
overwritten. `is_slp` is revised using block membership and the
`hr_exc_night` flag; `main_slp` is recomputed entirely from the joined
block metadata. Neither original value is retained in the output.
