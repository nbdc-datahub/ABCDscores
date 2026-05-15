# Computes the number of valid observation days

This helper function summarizes the number of available days
contributing to weekly sleep or activity estimates, with separation into
weekday and weekend counts.

## Usage

``` r
compute_day_counts(df)
```

## Arguments

- df:

  tbl. Data frame containing at minimum: `participant_id`, `session_id`,
  `wk`, and `dt_wknd` (logical indicator of weekend).

## Value

tbl. A weekly summary dataset with:

- `n_day`: Total number of valid days in the week.

- `n_wkdy`: Number of weekday observations.

- `n_wknd`: Number of weekend observations.
