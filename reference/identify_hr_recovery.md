# Identify Recoverable Heart Rate Gaps During Sleep

Identifies period of missing heart rate during sleep that can be
recovered based on adjacent sleep minutes with valid heart rate.
Specifically, identifies sequences of heart rate values during sleep
that end at 23:59 and immediately followed by sleep periods with valid
heart rate values. These segments are marked as recoverable.

## Usage

``` r
identify_hr_recovery(data)
```

## Arguments

- data:

  tbl. Data frame heart rate column `hrate`, `session_id` & `dtt`.
  `data` is the output from the
  [`identify_hr_exclusions()`](https://software.nbdc-datahub.org/ABCDscores/reference/identify_hr_exclusions.md).

## Value

tbl. The input data frame with the following additional columns:

- `recover_hr`: TRUE if interval can should be excluded based on
  adjacency to plausible sleep.
