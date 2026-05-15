# Computes the circular mean of time-of-day values.

This function calculates an average time while accounting for the
circular nature of clock time. It converts times to angles on the unit
circle, computes the mean direction, and converts the result back to
HH:MM format.

## Usage

``` r
circular_mean_time(time_vec)
```

## Arguments

- time_vec:

  vector. A vector of time values (typically `POSIXct` or `hms`)
  representing times of day.

## Value

character. A single time value in `"HH:MM"` format representing the
circular mean of the input times. Returns `NA` if all inputs are
missing.
