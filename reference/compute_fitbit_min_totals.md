# Compute total valid minutes by day or by specified time bins

Computes the number of valid minutes, valid non-sleep minutes, and valid
sleep minutes for each participant and session, either by day or by
specified time bins.

## Usage

``` r
compute_fitbit_min_totals(data, bin_minutes)
```

## Arguments

- data:

  tbl. Data frame with exclusion flags.

- bin_minutes:

  numeric, positive whole number. Number of minutes.

## Value

A tibble with valid minute totals for each participant-event-period. The
output adds the following columns:

- `min_total`: Total valid minutes (not excluded by heart rate
  criteria).

- `min_actv`: Total valid non-sleep minutes.

- `min_slp`: Total valid sleep minutes.

- `min_nap_slp`: Total valid nap sleep minutes (sleep minutes that are
  not main sleep).

- `start`: If `bin_minutes` not daily (1440 minutes), start datetime of
  period

- `end`: If `bin_minutes` not daily (1440 minutes), end datetime of
  period.

## Note

- output of identify_hr_exclusions() or identify_hr_recovery()

- needs exclusion flags
