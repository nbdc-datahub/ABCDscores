# Summarize weekly activity scores

Computes weekly summary activity metrics at the participant-session-week
level.

Aggregates daily-level activity measures into weekly summaries,
including step counts, active minutes, intensity distributions, MET
values, and resting heart rate.

## Usage

``` r
summarize_activity(data)
```

## Arguments

- data:

  tbl. A daily-level activity dataset containing activity summary
  scores.

## Value

tbl. A weekly aggregated dataset with the following summaries:
