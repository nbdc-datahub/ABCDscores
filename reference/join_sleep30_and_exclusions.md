# Joins 30-second sleep epoch data with heart rate exclusion flags

Joins 30-second sleep epoch data with heart rate exclusion flags using a
minute-level timestamp alignment.

This function aligns sleep epoch data with exclusion information by
first converting each sleep observation into a minute-level timestamp
(`dtt_min`), then performing an exact join to attach heart rate–based
exclusion flags.

Sleep data are recorded in fixed 30-second epochs, where each row
represents a discrete sleep observation. These epochs are aggregated to
the minute level to ensure compatibility with exclusion data that
operate at minute resolution.

## Usage

``` r
join_sleep30_and_exclusions(data_sleep, data_exclusions)
```

## Arguments

- data_sleep:

  tbl. Sleep epoch-level data containing at minimum: `participant_id`,
  `dtt`, and `stage`.

- data_exclusions:

  tbl. Heart rate exclusion dataset containing `participant_id` and
  minute-level timestamp (`dtt`).

## Value

tbl. A data frame of sleep epochs with attached heart rate exclusion
information, matched at the minute level. The output includes all
columns from `data_exclusions` along with sleep stage information.

## Note

- `data_sleep`: fitbit_raw_sleep or fitbit_covid_raw_sleep

- `data_exclusions`: output of identify_hr_exclusions() or
  identify_hr_recovery(); needs exclusion flags

- data input: 30-second sleep epoch data and heart rate exclusion data
