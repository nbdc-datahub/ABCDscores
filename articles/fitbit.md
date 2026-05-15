# Computing Daily and Weekly Fitbit Scores

## Introduction

This vignette describes the pipeline for computing daily and weekly
Fitbit activity and sleep summary scores. The pipeline processes
minute-level epoch data through a series of heart rate quality control
steps before aggregating to daily and then weekly summaries.

All the relevant code for computing these scores can be found in the
`R/scores_nt_fitbit.R` file in the `ABCDscores` package, which has the
following structure.

### Exported functions

There are six main exported functions, four for daily and two for weekly
summaries.

The four functions that compute the **daily summaries** are:

**Weekly summaries** are computed from the daily outputs using:

The above two weekly summary functions are wrappers around a primary
function that computes weekly summaries,
[`compute_fitbit_weekly_summary()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_weekly_summary.md).

### Internal Processing Functions

In addition to the exported functions, several internal functions are
used to compute these scores.

These internal functions can be called by using the
`pkg_name:::function_name()` syntax, e.g.,
`ABCDscores:::identify_hr_exclusions()`.

## Input Data

The activity functions take two input data frames:

- `data_activity`: either `fitbit_raw_activity` or
  `fitbit_covid_raw_activity`, and
- `data_daily`: either `fitbit_raw_metrics` or
  `fitbit_covid_raw_metrics`

While the sleep functions additionally require:

- `data_sleep_combined`: either `fitbit_raw_sleep` or
  `fitbit_covid_raw_sleep`

These files are available in the ABCD 7.0 release and later.

### data_activity

> either `fitbit_raw_activity` or `fitbit_covid_raw_activity`

Minute-level epoch data. Required columns:

- `participant_id`: Participant identifier
- `session_id`: Session identifier
- `dtt`: POSIXct timestamp
- `hrate`: Heart rate (bpm)
- `steps`: Step count
- `intnst`: Activity intensity (0–3)
- `mets`: Metabolic equivalent of task
- `is_slp`: Logical, whether epoch was classified as sleep
- `day`: Study day index (integer; day 0 = pre-study, day 1 = first
  study day)
- `main_slp`: Logical, whether epoch belongs to main sleep period

### data_daily

> either `fitbit_raw_metrics` or `fitbit_covid_raw_metrics`

Daily Fitbit-generated summary data. Required columns:

- `participant_id`, `session_id`, `dt`
- `hrate_rest_fitb`: Fitbit resting heart rate
- `steps_fitb`: Fitbit-reported daily step count

### data_sleep_combined

> either `fitbit_raw_sleep` or `fitbit_covid_raw_sleep`

30-second epoch sleep stage data. Required columns:

- `participant_id`, `session_id`, `dtt`
- `stage`: Sleep stage (`"light"`, `"deep"`, `"rem"`, `"awake"`, etc.)
- `main_slp`: Logical, whether epoch is associated with main sleep

## Data Exclusions using Heart Rate QC

Before any scores are computed, each pipeline invokes a QC step to
identify and exclude problematic or erroneous epochs (Wing et al., 2022)
based on QC of the heart rate data using two internal functions:

### `identify_hr_exclusions()`

Flags implausible or poor-quality heart rate epochs based on four
criteria:

1.  **Low heart rate** (`hrate_low`): heart rate below `hr_low` (default
    50 bpm)
2.  **High heart rate** (`hrate_hi`): heart rate above `hr_high`
    (optional; `NULL` by default)
3.  **Missing heart rate** (`hrate_no`): `NA` values in `hrate`
4.  **Plateau / repeated values** (`hrate_repeat_actv`,
    `hrate_repeat_slp`): consecutive identical values exceeding
    `hr_rep_day` (default 10 epochs) during wake, or `hr_rep_sleep`
    (default 30 epochs) during sleep

> A conservative bookend fill is applied before plateau detection: runs
> of missing values bounded by identical values on both sides are
> temporarily filled for the purpose of plateau detection only.

Exclusion flags follow a strict priority hierarchy: repeat exclusions
take precedence over all others, ensuring plateau detection is not
masked by co-occurring low, high, or missing flags.

The composite flag `hrate_excluded` is `TRUE` if any exclusion criterion
is met. Two domain-specific flags — `hr_exc_day` (wake) and
`hr_exc_night` (sleep) — are also retained internally to support
downstream detection of implausible sleep structure (`flg_slp`), which
relies on distinguishing HR issues that occurred during wake from those
that occurred during sleep.

### `identify_hr_recovery()`

Identifies heart rate exclusions at the midnight boundary. When a sleep
run with missing heart rate ends at 23:59 and is immediately followed by
a contiguous sleep run with valid heart rate, the earlier run is marked
`recover_hr = TRUE`. The `min_extra_nohrate_slp` column in the sleep
table counts these flagged minutes, giving analysts visibility into how
much excluded sleep time may have been valid. These epochs remain
excluded from all summary scores.

## Understanding Released Scores

### Choosing Between Standard and Extended Scores

The **standard functions**
([`compute_fitbit_activity_table()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_table.md),
[`compute_fitbit_sleep_table()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_table.md))
use Fitbit’s built-in sleep classification directly.

The **extended functions**
([`compute_fitbit_activity_table_ext()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_table_ext.md),
[`compute_fitbit_sleep_table_ext()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_table_ext.md))
add an episode-based sleep reconstruction step before computing
summaries. Sleep epochs are grouped into continuous blocks using
[`create_block_ranges()`](https://software.nbdc-datahub.org/ABCDscores/reference/create_block_ranges.md),
with short gaps between epochs bridged within the same episode. Heart
rate exclusions are then recomputed on the revised sleep classification.
This approach can produce different results from the standard functions
when Fitbit’s built-in sleep classification produces fragmented or
discontinuous sleep blocks.

### Daily Activity Table

#### Standard: `compute_fitbit_activity_table()`

``` r

activity_day <- compute_fitbit_activity_table(
  data_activity          = fitbit_raw_activity,
  data_daily             = fitbit_raw_metrics,
  hr_low                 = 50,
  hr_high                = NULL,
  hr_rep_day             = 10,
  hr_rep_sleep           = 30,
  bin_minutes            = 1440,
  append_daily_fitbit_qc = TRUE,
  qc_threshold           = .8,
  offset                 = "12:00",
  min_actv_minutes       = 600
)
```

**Key parameters:**

- `bin_minutes`: Aggregation window in minutes. Use `1440` for
  calendar-day summaries (default). Smaller values (e.g., `60`) produce
  sub-daily bins.
- `offset`: Time of day (HH:MM) used as the day boundary for
  sleep-aligned dates — timestamps after this time are assigned to the
  next day’s `sleep_date`. Also passed to
  [`make_offset()`](https://software.nbdc-datahub.org/ABCDscores/reference/make_offset.md)
  to compute `flg_30sec` (the 30-second sleep presence indicator). When
  `offset = NULL`, `bin_minutes` is used instead. The two are
  effectively mutually exclusive.
- `min_actv_minutes`: Threshold for the `qc_{n}min` quality control
  flag. A day passes QC if `min_actv >= min_actv_minutes`. Passing `600`
  creates `qc_600min`; passing `480` creates `qc_480min`, etc.
- `append_daily_fitbit_qc`: If TRUE, appends Fitbit-reported step counts
  and computes `qc_steps` and `pcnt_steps_fitb`. Only available when
  `bin_minutes` = 1440.
- `qc_threshold`: Minimum proportion of Fitbit-reported steps that
  computed active steps must meet for qc_steps to pass. Defaults to 0.8.
  qc_steps is `TRUE` if `steps_actv >= qc_threshold * steps_fitb`,
  `FALSE` if below that threshold, and `NA` if steps_fitb is zero or
  missing. `pcnt_steps_fitb` gives the underlying ratio
  (`steps_actv / steps_fitb`), set to 1 when both values are equal, and
  NA when steps_fitb is zero or missing.

**Output columns include:**

- Identifiers: `participant_id`, `session_id`, `wk`, `day`, `dt`,
  `dt_day`, `dt_wknd`
- Minutes: `min_total`, `min_actv`, `min_slp`, `min_nap_slp`
- Steps: `steps_total`, `steps_actv`, `steps`, `steps_fitb`
- Intensity: `mets`, `mets_actv`, `min_intnst_sed_*`,
  `min_intnst_light_*`, `min_intnst_mod_*`, `min_intnst_vigor_*` (total
  and active variants)
- HR exclusions: `excl_min_total_actv`, `excl_min_lowhrate_actv`,
  `excl_min_nohrate_actv`, `excl_min_repeathrate_actv` (and sleep
  equivalents)
- QC: `qc_{n}min`, `qc_steps`, `pcnt_steps_fitb`
- Flags: `flg_30sec`, `flg_any`

**Day numbering:** Day 0 (pre-study data) is excluded from the output
via `filter(day != 0)`. Study week is derived as
`wk = (day - 1) %/% 7 + 1`.

#### Extended: `compute_fitbit_activity_table_ext()`

``` r

activity_day_ext <- compute_fitbit_activity_table_ext(
  data_activity          = fitbit_raw_activity,
  data_daily             = fitbit_raw_metrics,
  hr_low                 = 50,
  hr_rep_day             = 10,
  hr_rep_sleep           = 30,
  bin_minutes            = 1440,
  append_daily_fitbit_qc = TRUE,
  offset                 = "12:00",
  min_actv_minutes       = 600,
  main_duration          = 180,
  gap                    = 90
)
```

The extended pipeline adds an episode-based sleep reconstruction step
before computing activity scores. Sleep epochs are grouped into
continuous blocks using
[`create_block_ranges()`](https://software.nbdc-datahub.org/ABCDscores/reference/create_block_ranges.md),
with gaps up to `gap` minutes (default 90) bridged within the same
episode. Heart rate exclusions are then recomputed on the revised sleep
classification. Additional parameters:

- `gap`: Maximum allowed gap in minutes between sleep epochs before
  starting a new episode.
- `main_duration`: Minimum episode duration in minutes to qualify as
  main sleep (default 180).

### Daily Sleep Table

#### Standard: `compute_fitbit_sleep_table()`

``` r

sleep_day <- compute_fitbit_sleep_table(
  data_activity        = fitbit_raw_activity,
  data_sleep_combined  = fitbit_raw_sleep,
  data_daily           = fitbit_raw_metrics,
  hr_low               = 50,
  hr_high              = NULL,
  hr_rep_sleep         = 30,
  bin_minutes          = NULL,
  offset               = "12:00",
  min_slp_minutes      = 300
)
```

**Key parameters:**

- `bin_minutes`: If `NULL` (default), sleep is aligned using `offset`
  and sleep timing variables (`dtt_start_slp`, `dtt_end_slp`, WASO) are
  computed. If a numeric value is supplied, data is binned by that
  interval instead and timing variables are not calculated.
- `offset`: Noon-to-noon boundary (default `"12:00"`). Sleep occurring
  after noon is assigned to the following day’s `sleep_date`.
- `min_slp_minutes`: Threshold for the `qc_{n}min` QC flag. A day passes
  if `min_total_slp >= min_slp_minutes`. Passing `300` creates
  `qc_300min`.

**Output columns include:**

- Identifiers: `participant_id`, `session_id`, `wk`, `day`, `dt`,
  `dt_day`, `dt_wknd`
- Timing: `dtt_start_bed`, `dtt_end_bed`, `dtt_start_slp`, `dtt_end_slp`
- Duration: `min_total_slp`, `min_asleep_slp`, `min_restless_slp`,
  `min_light_slp`, `min_deep_slp`, `min_rem_slp`, `min_nap_slp`,
  `min_wake`
- WASO: `min_waso`, `n_waso`
- HR by stage: `hrate_awake_slp`, `hrate_restless_slp`,
  `hrate_asleep_slp`, `hrate_light_slp`, `hrate_deep_slp`,
  `hrate_rem_slp`, `hrate_nap_slp`, `hrate_rest_fitb`
- HR exclusions: `excl_min_total_slp`, `excl_min_lowhrate_slp`,
  `excl_min_nohrate_slp`, `excl_min_repeathrate_slp`,
  `min_extra_nohrate_slp`
- QC: `qc_{n}min`
- Flags: `flg_slp`, `flg_any`

**Sleep date alignment:** Sleep dates are aligned to study day numbers
using `data_activity` rather than the raw sleep data `day` column, since
the offset may shift `sleep_date` forward by one calendar day.

**Implausible sleep flagging:** `flg_slp = TRUE` when a run of
HR-flagged awake minutes (\>= 30 minutes by default) immediately follows
a sleep run with no HR issues, suggesting device removal during a
recorded sleep period. This flag is only computed when
`bin_minutes = NULL`.

#### Extended: `compute_fitbit_sleep_table_ext()`

``` r

sleep_day_ext <- compute_fitbit_sleep_table_ext(
  data_activity        = fitbit_raw_activity,
  data_sleep_combined  = fitbit_raw_sleep,
  data_daily           = fitbit_raw_metrics,
  hr_low               = 50,
  hr_rep_day           = 10,
  hr_rep_sleep         = 30,
  bin_minutes          = NULL,
  offset               = "12:00",
  min_slp_minutes      = 300,
  main_duration        = 180,
  gap                  = 90
)
```

The extended sleep pipeline reconstructs sleep episodes from 30-second
epochs before computing summaries. This is the same episode-based
approach as the extended activity table — sleep blocks are formed using
[`create_block_ranges()`](https://software.nbdc-datahub.org/ABCDscores/reference/create_block_ranges.md),
and main sleep is redefined based on block duration. HR exclusion
thresholds are doubled during the second pass (`hr_rep_day * 2`,
`hr_rep_sleep * 2`) because the sleep data operates on 30-second epochs
rather than the minute-level epochs used in the activity pipeline, so
twice as many consecutive identical values are expected for the same
duration of flat HR signal. Pass the same (un-doubled) values you would
use for minute-level data; the function doubles them internally.

### Weekly Summaries

Weekly summaries are computed from the daily tables using
[`compute_fitbit_activity_week()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_week.md)
and
[`compute_fitbit_sleep_week()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_week.md).
Before aggregation, days are filtered using the `filter_expr` parameter
to retain only those passing quality control. The default filters are:

- Activity: `qc_600min` & `qc_steps` — retains days with at least 600
  valid active minutes and step count concordance with Fitbit-reported
  totals
- Sleep: `qc_300min` — retains days with at least 300 valid sleep
  minutes

``` r

activity_week <- compute_fitbit_activity_week(
  df          = activity_day,
  filter_expr = qc_600min & qc_steps
)

sleep_week <- compute_fitbit_sleep_week(
  df = sleep_day,
  filter_expr = qc_300min
)
```

Important: `filter_expr` must reference columns that exist in the daily
table. If `append_daily_fitbit_qc = FALSE` was passed to
[`compute_fitbit_activity_table()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_table.md),
the `qc_steps` column will be absent and the default `filter_expr` will
fail. Update `filter_expr` to drop qc_steps in that case. Similarly, if
`min_actv_minutes` or `min_slp_minutes` were changed from their
defaults, the `qc_{n}min` column name changes accordingly and
`filter_expr` must match — see Valid Minute Thresholds.

Each function produces three parallel summaries per
participant-session-week, identified by `wk_type`:

**QC flag (`qc_wk`):** A week is considered valid if it meets minimum
day count thresholds (defaults: 3 weekdays, 1 weekend day). For
whole-week estimates, both thresholds must be met. For weekday/weekend
strata, only the relevant threshold applies. These thresholds can be
adjusted by calling
[`compute_fitbit_weekly_summary()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_weekly_summary.md)
directly with `wkdy_min` and `wknd_min` values that match your coverage
requirements.

**Filtering:** Only days passing the `filter_expr` are included before
aggregation. Day counts (`n_day`, `n_wkdy`, `n_wknd`) reflect valid days
only and are used to compute `qc_wk`.

**Heart rate aggregation in sleep:** Stage-specific heart rate values
are computed as duration-weighted means rather than simple means, e.g.:

``` r

hrate_light_slp = sum(hrate_light_slp * min_light_slp) / sum(min_light_slp)
```

**Circular mean for timing variables:** Bed/sleep onset and offset times
are averaged using circular mean arithmetic to correctly handle times
that span midnight.

## Re-computing Scores

### Key Parameters to Change

#### `bin_minutes` and `offset`

When `bin_minutes = NULL` (default), days are defined using `offset` — a
noon-to-noon boundary where sleep occurring after noon is assigned to
the following day’s `sleep_date`. This alignment better captures the
natural sleep period, which typically spans midnight. In this mode,
sleep timing variables (`dtt_start_bed`, `dtt_end_bed`, `dtt_start_slp`,
`dtt_end_slp`), WASO (`min_waso`, `n_waso`), and implausible sleep
flagging (`flg_slp`) are all computed.

When `bin_minutes` is set to a numeric value, data is aggregated into
fixed time bins of that length (e.g., `1440` for full calendar days).
The `offset` is ignored in this mode and sleep timing variables, WASO,
and `flg_slp` are not computed — those columns will be empty in the
output.

``` r

# Default: noon-to-noon sleep day alignment
# Sleep timing and WASO variables are computed
compute_fitbit_sleep_table(
  ...,
  bin_minutes = NULL, # sleep timing and WASO are computed
  offset      = "12:00" # sleep after noon assigned to next day
)

# Binned: calendar-day aggregation, no timing variables
compute_fitbit_sleep_table(
  ...,
  bin_minutes = 1440, # aggregate to full calendar days
  offset      = NULL # offset is ignored when bin_minutes is set
)
```

Use `bin_minutes = 1440` only if sleep timing and WASO variables are not
needed and a simpler calendar-day aggregation is sufficient. Use smaller
values (e.g., `60`) only if sub-daily summaries are needed.

#### Valid Minute Thresholds

`min_actv_minutes` and `min_slp_minutes` thresholds control the name and
value of the QC flag column in the daily summary output. Changing the
value changes the column name:

``` r

# Produces column: qc_600min
compute_fitbit_activity_table(..., min_actv_minutes = 600)

# Produces column: qc_480min
compute_fitbit_activity_table(..., min_actv_minutes = 480)

# Produces column: qc_300min
compute_fitbit_sleep_table(..., min_slp_minutes = 300)
```

> **Important:** The `filter_expr` in
> [`compute_fitbit_activity_week()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_activity_week.md)
> must match the threshold used in the daily function. If you change
> `min_actv_minutes`, update `filter_expr` accordingly — otherwise the
> filter will fail to find the column.

``` r

# Consistent: both use 600 minutes
activity_day <- compute_fitbit_activity_table(
  ...,
  min_actv_minutes = 600 # creates qc_600min
)
activity_week <- compute_fitbit_activity_week(
  df          = activity_day,
  filter_expr = qc_600min & qc_steps # matches above
)

# If you change the threshold, update filter_expr too
activity_day <- compute_fitbit_activity_table(
  ...,
  min_actv_minutes = 480 # creates qc_480min
)
activity_week <- compute_fitbit_activity_week(
  df          = activity_day,
  filter_expr = qc_480min & qc_steps # updated to match
)
```

#### Heart Rate Thresholds

The default heart rate exclusion parameters follow recommendations from
(Wing et al., 2022). Heart rate values below `hr_low` (default 50 bpm)
or above `hr_high` (default `NULL`, i.e. no upper bound) are flagged as
invalid, and all data for those minutes — including steps, METs, and
intensity — are excluded from summary scores. The repeat thresholds
(`hr_rep_day`, `hr_rep_sleep`) control how many consecutive identical
heart rate values are tolerated before flagging a plateau — lower values
are more aggressive in excluding flat HR signals. All parameters can be
adjusted to suit user needs.

``` r

compute_fitbit_activity_table(
  ...,
  hr_low       = 50, # exclude epochs with HR below 50 bpm
  hr_high      = NULL, # set a value (e.g., 200) to exclude high HR
  hr_rep_day   = 10, # flag runs of identical HR > 10 epochs during wake
  hr_rep_sleep = 30 # flag runs of identical HR > 30 epochs during sleep
)
```

Setting any parameter to `NULL` disables that check entirely. For
example, `hr_high = NULL` (default) applies no upper bound on heart
rate, and `hr_rep_day = NULL` disables plateau detection during wake
epochs. Note that in
[`compute_fitbit_sleep_table()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_table.md)
or
[`compute_fitbit_sleep_table_ext()`](https://software.nbdc-datahub.org/ABCDscores/reference/compute_fitbit_sleep_table_ext.md),
`hr_rep_day` and `hr_rep_sleep` should not be `NULL` as plateau
detection is needed to correctly identify implausible sleep structures
(`flg_slp`).

#### Daily Metrics

Daily resting heart rate values (`hrate_rest_fitb`) are appended to both
sleep and activity daily score summaries from `data_daily`. Note that
when data is binned to sub-daily intervals (`bin_minutes < 1440`), the
same resting heart rate value associated with that calendar date will be
repeated across all bins within a day.

Fitbit-reported step counts (`steps_fitb`) and the corresponding step
count quality control variables (`qc_steps`, `pcnt_steps_fitb`) are
optionally appended to activity summaries by setting
`append_daily_fitbit_qc = TRUE` (the default). `qc_steps` flags days
where computed steps are at least 80% of Fitbit-reported steps;
`pcnt_steps_fitb` gives the underlying percentage. When
`append_daily_fitbit_qc = FALSE`, these columns are omitted from the
output.

### Example: Re-run Full Pipeline

The recommended end-to-end workflow processes daily summaries first,
then passes them to the weekly aggregation functions. The following code
runs the full pipeline using default parameters, which follow
recommendations from (Wing et al., 2022).

``` r

# Step 1: Compute daily activity scores
activity_day <- compute_fitbit_activity_table(
  data_activity          = fitbit_raw_activity,
  data_daily             = fitbit_raw_metrics,
  hr_low                 = 50,
  hr_high                = NULL,
  hr_rep_day             = 10,
  hr_rep_sleep           = 30,
  bin_minutes            = 1440,
  append_daily_fitbit_qc = TRUE,
  qc_threshold           = .8,
  offset                 = "12:00",
  min_actv_minutes       = 600
)

# Step 2: Compute daily sleep scores
sleep_day <- compute_fitbit_sleep_table(
  data_activity       = fitbit_raw_activity,
  data_sleep_combined = fitbit_raw_sleep,
  data_daily          = fitbit_raw_metrics,
  hr_low              = 50,
  hr_high             = NULL,
  hr_rep_day          = 10,
  hr_rep_sleep        = 30,
  bin_minutes         = NULL,
  offset              = "12:00",
  min_slp_minutes     = 300
)

# Step 3: Aggregate to weekly activity summaries
# filter_expr must reference the qc column created in Step 1
activity_week <- compute_fitbit_activity_week(
  df          = activity_day,
  filter_expr = qc_600min & qc_steps
)

# Step 4: Aggregate to weekly sleep summaries
sleep_week <- compute_fitbit_sleep_week(
  df = sleep_day
)
```

### Example: Relaxed Quality Control Pipeline

The default pipeline requires 600 valid active minutes per day and 300
valid sleep minutes. These thresholds, along with the heart rate
exclusion parameters, can be adjusted to support alternative quality
control criteria. The following example lowers the valid minute
thresholds, adjusts the heart rate exclusion parameters, and updates
filter_expr to remain aligned with the revised thresholds.

``` r

# Step 1: Compute daily activity scores
activity_day <- compute_fitbit_activity_table(
  data_activity          = fitbit_raw_activity,
  data_daily             = fitbit_raw_metrics,
  hr_low                 = 40, # changed: more permissive lower HR bound
  hr_high                = 250, # changed: added upper HR bound
  hr_rep_day             = 15, # changed: tolerate longer flat HR runs during wake
  hr_rep_sleep           = 40, # changed: tolerate longer flat HR runs during sleep
  bin_minutes            = 1440,
  append_daily_fitbit_qc = TRUE,
  qc_threshold           = .5, # changed: tolerate lower accordance between device step count and step score
  offset                 = "17:00", # changed: shifted day boundary to better align with later sleep onset times
  min_actv_minutes       = 480 # changed: require 480 rather than 600 valid minutes
)

# Step 2: Compute daily sleep scores
sleep_day <- compute_fitbit_sleep_table(
  data_activity       = fitbit_raw_activity,
  data_sleep_combined = fitbit_raw_sleep,
  data_daily          = fitbit_raw_metrics,
  hr_low              = 40, # changed: must match activity pipeline
  hr_high             = 250, # changed: must match activity pipeline
  hr_rep_day          = 15, # changed: must match activity pipeline
  hr_rep_sleep        = 40, # changed: must match activity pipeline
  bin_minutes         = NULL,
  offset              = "17:00", # changed: must match activity pipeline
  min_slp_minutes     = 240 # changed: require 240 rather than 300 valid sleep minutes
)

# Step 3: Aggregate to weekly activity summaries
activity_week <- compute_fitbit_activity_week(
  df          = activity_day,
  filter_expr = qc_480min & qc_steps # changed: matches min_actv_minutes = 480 above
)

# Step 4: Aggregate to weekly sleep summaries
sleep_week <- compute_fitbit_sleep_week(
  df          = sleep_day,
  filter_expr = qc_240min # changed: matches min_slp_minutes = 240 above
)
```

Two reminders when re-computing scores:

- `bin_minutes` and `offset` are mutually exclusive in the sleep
  pipeline. Providing a non-`NULL` `bin_minutes` triggers a warning that
  `offset` will be ignored, and sleep timing/WASO variables will be
  empty.
- The `qc_{n}min` column name is dynamically generated from the
  `min_actv_minutes` / `min_slp_minutes` parameter, so passing `600`
  produces `qc_600min`, passing `300` produces `qc_300min`, and so on.

## References

Wing, D., Godino, J. G., Baker, F. C., Yang, R., Chevance, G., Thompson,
W. K., Reuter, C., Bartsch, H., Wilbur, A., Straub, L. K., Castro, N.,
Higgins, M., Colrain, I. M., Zambotti, M. de, Wade, N. E., Lisdahl, K.
M., Squeglia, L. M., Ortigara, J., Fuemmeler, B., … Bagot, K. S. (2022).
Recommendations for identifying valid wear for consumer-level wrist-worn
activity trackers and acceptability of extended device deployment in
children. *Sensors*, *22*(23), 9189. <https://doi.org/10.3390/s22239189>
