# Compute time interval between two dates

Calculate the time difference between two dates in specified units
(years, months, or days). Uses lubridate intervals for accurate
calculations across calendar irregularities.

## Usage

``` r
compute_age(date_start, date_end, unit = c("years", "months", "days"))
```

## Arguments

- date_start:

  Starting date. Must be a date or datetime object compatible with
  lubridate.

- date_end:

  Ending date. Must be a date or datetime object compatible with
  lubridate.

- unit:

  Character string specifying the unit for the result. Must be one of
  "years", "months", or "days". Defaults to "years".

## Value

A numeric value representing the time difference in the specified unit.

## Examples

``` r
# Calculate age in years
compute_age(as.Date("1990-01-01"), as.Date("2024-01-01"))
#> [1] 34

# Calculate age in months
compute_age(as.Date("2023-01-01"), as.Date("2024-01-01"), unit = "months")
#> [1] 12

# Calculate age in days
compute_age(as.Date("2023-12-01"), as.Date("2024-01-01"), unit = "days")
#> [1] 31
```
