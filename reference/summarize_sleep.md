# Computes weekly summary sleep metrics

Computes weekly summary sleep metrics at the participant-session-week
level.

Aggregates daily-level sleep measures into weekly summaries, including
totals, means, circular time averages, and heart rate metrics.

## Usage

``` r
summarize_sleep(data)
```

## Arguments

- data:

  tbl. Sleep dataset containing at daily-level sleep summary scores.

## Value

tbl. A weekly aggregated dataset with the following summaries:

Time-based summaries:

- `mean_t_start_bed`: Circular mean bed start time.

- `mean_t_end_bed`: Circular mean bed end time.

- `mean_t_start_slp`: Circular mean sleep onset time.

- `mean_t_end_slp`: Circular mean sleep end time.

Mean sleep metrics:

- `mean_min_slp_total`, `mean_min_asleep_slp`, `mean_min_restless_slp`,
  `mean_min_light_slp`, `mean_min_deep_slp`, `mean_min_rem_slp`,
  `mean_min_wake`, `mean_min_waso`

Heart rate–weighted metrics:

- `mean_hrate_awake_slp`: Mean HR during awake periods (weighted by
  minutes awake)

- `mean_hrate_restless_slp`: Mean HR during restless sleep

- `mean_hrate_asleep_slp`: Mean HR during asleep periods

- `mean_hrate_light_slp`: Mean HR during light sleep

- `mean_hrate_deep_slp`: Mean HR during deep sleep

- `mean_hrate_rem_slp`: Mean HR during REM sleep

Wake fragmentation:

- `mean_n_waso`: Mean number of WASO events per day

## Details

Heart rate–weighted metrics are computed using duration-weighted
averages, ensuring that longer stage durations contribute proportionally
more to the final estimate. All mean-based outputs are rounded to one
decimal place.

Circular time variables are computed using circular statistics to
correctly handle times near midnight.
