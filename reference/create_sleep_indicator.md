# Create a sleep presence indicator

Filters out heart-rate-excluded epochs and non-main sleep periods, then
marks each remaining record with a binary sleep presence flag
(`has_sleep_30 = TRUE`). The date column used to represent each record
is determined by `offset`: either the pre-computed `sleep_date` or a
floored time bin derived from `dtt`.

## Usage

``` r
create_sleep_indicator(df, bin_minutes = NULL)
```

## Arguments

- df:

  tbl. Sleep data processed for exclusions. Requires columns:
  `hrate_excluded`, `main_slp`, `session_id`, `participant_id`, and
  either `sleep_date` or `dtt`.

- bin_minutes:

  numeric, positive whole number or NULL. Width of time bins in minutes.
  If NULL (default), data is returned at the sleep-date level.
  Otherwise, data is aggregated into bins of the specified width (e.g.,
  60 for hourly, 1440 for calendar day). bin data. If FALSE, bins will
  be created based on the `dtt` timestamp column.

## Value

tbl with the following columns:

- `participant_id`: Participant identifier.

- `session_id`: Session identifier, coerced to factor.

- `date`: Date of the sleep period.

- `has_sleep_30`: logical

## Note

Input dataframe should be output if identify_hr_exclusions() or
identify_hr_recovery() functions. If `offset` parameter is `NULL`, the
`sleep_date` column will be used to bin data. Otherwise, bins will be
created based on the `dtt` timestamp column, with bin boundaries aligned
to the epoch start (e.g., 00:00, 01:00 for hourly bins).
