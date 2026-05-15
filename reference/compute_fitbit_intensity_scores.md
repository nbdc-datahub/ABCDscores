# Compute METs and activity intensity summary metrics

Computes METS and activity summary scores by day or by specified time
bins (e.g., 15-min, 30-min, 60-min), with optional integration of daily
step count QC from raw metrics.

## Usage

``` r
compute_fitbit_intensity_scores(data, bin_minutes)
```

## Arguments

- data:

  tbl. Activity dataframe with `mets` and `intnst` (intensity) variables
  with heart rate exclusions (`hrate_excluded`).

- bin_minutes:

  numeric, positive whole number. Number of minutes to bin data by.

## Value

tbl. The input data frame with the following additional columns:

- `mets`: mean METs after heart rate exclusions.

- `mets_actv`: mean METS for non-sleep minutes after heart rate
  exclusions.

- `min_intnst_sed_total`: Minutes spent in sedentary active, after heart
  rate exclusions.

- `min_intnst_light_total`: Minutes spent in light active, after heart
  rate exclusions.

- `min_intnst_mod_total`: Minutes spent in moderate active, after heart
  rate exclusions.

- `min_intnst_vigor_total`: Minutes spent in vigorous active, after
  heart rate exclusions.

- `min_intnst_sed_actv`: Non-sleep minutes spent in sedentary active,
  after heart rate exclusions.

- `min_intnst_light_actv`: Non-sleep minutes spent in light active,
  after heart rate exclusions.

- `min_intnst_mod_actv`: Non-sleep minutes spent in moderate active,
  after heart rate exclusions.

- `min_intnst_vigor_actv`: Non-sleep minutes spent in vigorous active,
  after heart rate exclusions.

- `start`: If non-daily bin selected (i.e. != 1440 minutes), start time
  stamp of bin.

- `end`: If non-daily bin selected (i.e., != 1440 minutes), end time
  stamp of the bin.

## Note

- `data`: output of identify_hr_exclusions() or identify_hr_recovery();
  needs exclusion flags
