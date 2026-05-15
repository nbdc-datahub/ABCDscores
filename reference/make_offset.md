# Assign sleep-aligned date using time-of-day offset

Assigns a sleep-aligned date (`sleep_date`) based on a specified daily
offset time. This is used to shift the day boundary (e.g noon-to-noon)
so that overnight sleep periods are grouped within a single "sleep day"
rather than split across calendar days.

## Usage

``` r
make_offset(sleep_dataframe, offset = "12:00")
```

## Arguments

- sleep_dataframe:

  tbl. Data frame with POSIXct timestamp column `dtt`.

- offset:

  character. Time of day (HH:MM) used as the cutoff for defining the
  sleep day. Timestamps occuring after this time are assigned to the
  next day.

## Value

tbl. The input data frame with the `sleep_date` column.
