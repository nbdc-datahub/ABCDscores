# Generates weekly activity summaries

Generates weekly activity summaries from daily Fitbit activity data.

This wrapper function applies a standardized weekly aggregation pipeline
using
[`compute_fitbit_weekly_summary()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_weekly_summary.md)
and the
[`summarize_activity()`](https://software.nbdc-datahub.org/ABCDscores/reference/summarize_activity.md)
function to compute weekly activity metrics at the participant-session
level.

Only days passing minimum quality control thresholds (`qc_600min` and
`qc_steps`) are included in the weekly aggregation.

## Usage

``` r
compute_fitbit_activity_week(df, filter_expr = qc_600min & qc_steps)
```

## Arguments

- df:

  tbl. Daily-level Fitbit activity dataset (standard or extended),
  typically `fitbit_ss_activity_day` or `fitbit_ss_ext_activity_day`.

- filter_expr:

  expression. Logical filtering condition applied to the input dataset
  before summarization (e.g., QC thresholds). which retains only days
  with at least 600 valid minutes and passing step count quality checks.

## Value

tbl. Weekly activity dataset containing:

- Week identifiers (`wk`, `wk_type`)

- Day counts (`n_day`, `n_wkdy`, `n_wknd`)

- Activity summary metrics (steps, METs, intensity minutes, heart rate)

- Weekly quality control flag (`qc_wk`)

## Details

This function standardizes weekly activity computation across datasets
by enforcing consistent filtering, aggregation, and output structure.

## Note

- `df`: fitbit_ss_activity_day or fitbit_ss_ext_activity_day (daily
  Fitbit activity dataset with QC flags)
