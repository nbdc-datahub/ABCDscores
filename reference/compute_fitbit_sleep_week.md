# Generates weekly sleep summaries from daily Fitbit sleep data.

This wrapper function applies a standardized weekly aggregation pipeline
using
[`compute_fitbit_weekly_summary()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_weekly_summary.md)
and the
[`summarize_sleep()`](https://software.nbdc-datahub.org/ABCDscores/reference/summarize_sleep.md)
function to compute weekly sleep metrics at the participant-session
level.

Only days passing minimum quality control thresholds (`qc_300min`) are
included in the weekly aggregation.

## Usage

``` r
compute_fitbit_sleep_week(df, filter_expr = qc_300min)
```

## Arguments

- df:

  tbl. Daily-level Fitbit sleep dataset (standard or extended),
  typically `fitbit_ss_sleep_day` or `fitbit_ss_ext_sleep_day`.

- filter_expr:

  expression. Logical filtering condition applied to the input dataset
  before summarization (e.g., QC thresholds).

## Value

tbl. Weekly sleep dataset containing:

- Week identifiers (`wk`, `wk_type`)

- Day counts (`n_day`, `n_wkdy`, `n_wknd`)

- Sleep timing metrics (bed/sleep onset and offset)

- Sleep duration and stage summaries

- Heart rate–derived sleep metrics

- Wake-after-sleep-onset metrics

- Weekly quality control flag (`qc_wk`)

## Details

This function ensures consistent weekly aggregation of sleep metrics
across standard and extended Fitbit datasets. It inherits QC filtering
from the parent pipeline and preserves both total and stage-specific
sleep summaries.

## Note

- `df`: fitbit_ss_sleep_day or fitbit_ss_ext_sleep_day (daily Fitbit
  sleep dataset with QC flags)
