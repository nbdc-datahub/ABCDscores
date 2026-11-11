# Compute mean heart rate summary metrics

Computes mean heart rate by day or by specified time bins, after heart
rate exclusions. The mean heart rate columns are always computed here;
whether they are surfaced in the final output is gated by the calling
daily table function (via its `include_mean_hrate` parameter).

## Usage

``` r
compute_fitbit_mean_hrate_scores(data, bin_minutes)
```

## Arguments

- data:

  tbl. Activity dataframe with `hrate` and `is_slp` variables, with
  heart rate exclusions (`hrate_excluded`).

- bin_minutes:

  numeric, positive whole number. Number of minutes to bin data by.

## Value

tbl. A data frame with the following columns:

- `hrate_mean`: mean heart rate after heart rate exclusions.

- `hrate_mean_actv`: mean heart rate for non-sleep minutes after heart
  rate exclusions.

- `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
  stamp of bin.

- `end`: If non-daily bin selected (i.e., != 1440 minutes), end time
  stamp of the bin.

## Note

- `data`: output of identify_hr_exclusions() or identify_hr_recovery();
  needs exclusion flags
