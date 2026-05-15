# Generates weekly summary tables

Generates weekly summary tables using a user-supplied summarization
function, with stratification by weekday, weekend, and full-week
estimates.

This function standardizes weekly aggregation by: (1) filtering valid
records, (2) computing day counts for quality control, (3) applying a
user-defined summarization function, and (4) producing three parallel
weekly summaries (whole week, weekday-only, and weekend-only).

## Usage

``` r
compute_fitbit_weekly_summary(
  df,
  wkdy_min = 3,
  wknd_min = 1,
  summarize_fn,
  filter_expr
)
```

## Arguments

- df:

  tbl. Input daily-level dataset containing at minimum:
  `participant_id`, `session_id`, `wk`, and `dt_wknd`.

- wkdy_min:

  numeric. Minimum number of weekday observations required for a valid
  weekly weekday estimate.

- wknd_min:

  numeric. Minimum number of weekend observations required for a valid
  weekly weekend estimate.

- summarize_fn:

  function. A user-defined function that takes a filtered dataset and
  returns weekly summaries grouped by `participant_id`, `session_id`,
  and `wk`.

- filter_expr:

  expression. Logical filtering condition applied to the input dataset
  before summarization (e.g., QC thresholds).

## Value

tbl. A combined weekly dataset containing three types of summaries:

- `wk_type = 2`: Whole-week estimates (weekday + weekend combined)

- `wk_type = 1`: Weekend-only estimates

- `wk_type = 0`: Weekday-only estimates

Each row includes:

- Weekly summary metrics from `summarize_fn`

- Day count variables (`n_day`, `n_wkdy`, `n_wknd`)

- Quality control flag `qc_wk` indicating sufficient coverage

## Details

The function uses stratified counting to ensure that weekly estimates
are interpretable in the context of data completeness. The QC rule
differs by strata:

- Whole week: requires both weekday and weekend minimum counts

- Weekday/weekend: require minimum counts within their respective
  subsets

The `summarize_fn` argument allows flexible reuse across sleep and
activity pipelines while maintaining consistent weekly structure.
