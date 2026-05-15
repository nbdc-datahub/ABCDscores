# Flag Implausible Sleep Periods

Identifies days containing implausible sleep periods by detecting
sequences of heart rate issues that immediate follow sleep runs. A sleep
period is considered implausible when a sufficiently long run of
HR-flagged "awake" minutes immediate follows a sleep run that contained
no HR issues, suggesting the device may have been have been removed or
malfunctioned during what was recorded as sleep.

## Usage

``` r
flag_implausible_sleep(dt, min_minutes = 30, epoch_seconds = 60)
```

## Arguments

- dt:

  tbl. Data frame with `participant_id`, `dtt`, `is_slp`, `hrate_no`,
  and `hrate_repeat_actv` columns. This should be the output of
  [`identify_hr_exclusions()`](https://software.nbdc-datahub.org/ABCDscores/reference/identify_hr_exclusions.md)
  or 'identify_hr_recovery()'.

- min_minutes:

  numeric, positive whole number. Minimum number of consecutive
  HR-flagged "awake" minutes required to flag an implausible sleep
  period.

- epoch_seconds:

  numeric, positive whole number. Duration of each epoch in seconds.

## Value

tbl. A dataframe that returns a row for each flagged implausible sleep
event:

- `participant_id`: Participant identifier.

- `dtt`: Timestamp of the start of the flagged HR issue run.

## Note

- input: output of identify_hr_exclusions; need exclusions flags
