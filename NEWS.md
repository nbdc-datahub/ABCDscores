# ABCDscores 7.0.2

Date: 2026-08-19

## Changes

- Updated the package citation to the published journal article: Zhang, L.,
  Celhay, O., Das, B., Berman, S., Ziemer, L. R., Smith, C. J., Abad, S.,
  Dale, A. M., & Linkersdörfer, J. (2026). *ABCDscores: an R package for
  computing summary scores in the ABCD Study®*. *Frontiers in
  Neuroinformatics*, 20, 1858950. <https://doi.org/10.3389/fninf.2026.1858950>.
  This replaces the earlier bioRxiv preprint reference in `inst/CITATION`, the
  package startup message, the package-level documentation, and the README.

# ABCDscores 7.0.1

Date: 2026-07-09

## New features

- The `ss_*` utility functions (`ss_mean()`, `ss_sum()`, `ss_count()`,
  `ss_max()`, `ss_count_cond()`, `ss_mean_pos()`) now convert non-finite
  values (`Inf`, `-Inf`, `NaN`) to `NA` after coercing the input columns to
  numeric and before summarization, so they are treated like any other
  missing value. This includes character values such as `"Inf"` that only
  become non-finite through the coercion. `ss_nm()`, which does not coerce
  its inputs, applies the conversion to numeric columns only.
- The numeric coercion in the `ss_*` utility functions now raises an
  informative warning when values that cannot be interpreted as numbers
  (e.g., `"abc"`) are set to `NA`, naming the affected column and the
  number of values lost, instead of R's bare "NAs introduced by coercion"
  warning.
- The `ss_*` utility functions now abort when the requested score column
  `name` already exists in the input data, instead of silently producing a
  duplicated column name. `ss_count_cond(combine = TRUE)` now returns a
  tibble instead of a base data frame, and `ss_tscore()` and
  `combine_checkboxes()` gained additional input validation.
- Added a testthat unit test suite. It covers all 12 exported
  `ss_*` utility functions and the one-to-many compute functions behind the
  TLFB, SUI, SDSU, medication (`rx`), and family history scores, with
  hand-derived expected values for non-response code exclusion, missingness
  thresholds, event filtering, and return types. Each applicable function
  carries a regression case for the v6.1.0 factor-to-numeric coercion bug
  (factor codes silently converted to level indices).
- Added a *Performance & scalability* article to the package documentation,
  reporting a reproducible single-threaded benchmark of the scoring functions on
  the full ABCD 7.0 tabulated release. All 2,240 summary scores derivable from
  the tabulated release are computed in about 6.5 minutes on a laptop (Intel
  Core i7-13700H), with one-to-one and one-to-many functions timed separately.

## Bug fixes

- `compute_tlfb_maxdose()` now takes the maximum over per-day summed doses
  instead of individual substance rows, and `compute_tlfb_totdose_sum()`
  accumulates in chronological session order instead of input row order.
  Combined-substance maximum-dose scores and cumulative total-dose scores
  computed on unsorted data change accordingly.
- SDSU scores: the forecast for a terminal mid-year session now maps to the
  next annual session (e.g. `ses-06M` to `ses-07A`) instead of the already
  elapsed one, and `compute_ss_use_onset_event()` accepts character
  `session_id` columns (previously it required factors and errored otherwise).
- Documentation and error messages: `compute_ss_use_onset_age()` roxygen now
  documents the returned onset-age column as numeric (it was described as
  character), and `compute_famhx_endorsement()` now renders its intended
  error message when no columns match `var_matches` (a variable-name typo
  previously surfaced as a cli interpolation error instead).
- `compute_ph_y_meds_estuse_flags_all()` now flags youth medications
  correctly. The internal estimated-use engine matched category columns with
  a hardcoded `ph_p_meds__` prefix, so every `ph_y_meds` estimated-use flag
  was returned as `"0"` regardless of the reported medications. The candidate
  columns are now derived from each flag's `table_name`
  (`ph_p_meds` results are unchanged).

# ABCDscores 7.0.0

Date: 2026-05-13

## New features

- Added KSADS parent and youth summary scores for mental health and substance-use
  symptom domains (`mh_p_ksads`, `mh_y_ksads`, `su_p_ksads`, `su_y_ksads`).
- Added family history summary scores for combining checkbox style 
  endorsements into binary items endorsement and
  combined parent scores (`mh_p_famhx`).
- Added medication category and estimated-use flag scores using RxNorm-based
  medication mappings (`ph_p_meds`, `ph_y_meds`, `ph_p_dhx`).
- Added SU summary scores across multiple measures for lifetime use, onset age, 
  and onset event and TLFB lifetime total-dose summary scores updates
  (`su_y_dyn`, `su_y_stc`, `su_y_tlfb`).
- Added Prodromal Psychosis Scale / SIPS distress, severity, persistence,
  count, first-event, and ever-event scores (`mh_y_pps`, `mh_y_ppsss`).
- Added UCLA Loneliness Scale summary scores (`fc_y_lone`).
- Added combined unit scores for parent height and birthweght (`ph_p_anthr`, 
  `ph_p_dhx`).
- Added Native American Acculturation mean scores (`fc_y_na`, 
  `ab_p_demo__ntvam`).
- Added Fitbit summary scores for file-based data on activity and sleep at 
  the daily and weekly level, such as means, durations, and counts.
- Added vignettes (**Articles**) for `Family History (FAMHX) summary scores`,
  `Medication use and history`, `Static and Dynamic Substance Use (SDSU) summary scores`,
  and `Computing Daily and Weekly Fitbit Scores`.


## Changes

- Added documentation for installing from release tarballs.
- Reorganized substance-use score files and updated generated help files.
- Removed count validation threshold (`max_na`) from `mh_p_ple_count` and 
  `mh_y_ple_count`, so scores are now computed regardless of the number of 
  missing items.

## Bug fixes

- Fixed `mh_y_ysr` scoring, where three obsolete variables were still included
  and the missingness thresholds used outdated criteria. The total score now
  uses 102 items with a maximum of 5 missing items, subscales use the updated
  20% missing-item threshold, and T-score functions apply the same validation
  logic before returning a score.
- Fixed non-response handling in MH and FC scores. Values of 777
  are now excluded from `mh_y_peq`, `fc_y_fes`, `fc_y_vs`, `fc_y_pnh`,
  `fc_y_psb`, and `fc_y_srpf`; values of 777 and 999 are now excluded from
  `fc_p_fes`, `fc_p_vs`, and `fc_p_psb`; unnecessary exclusion criteria were
  removed from `fc_y_vs__famil` scores.
- Fixed `compute_ph_y_mctq__sd_count` school-data handling to 
  replace NAs with `0` when no school/work days endorsed and numeric.
- Fixed physical-health arithmetic where factor or character inputs could be
  used directly in numeric calculations. Birthweight, OTBI age, and parent
  height computations now coerce source variables to numeric before arithmetic
  or comparisons.
- Fixed EATQ mean computations where redundant `recode_levels()` calls could
  alter values before computing means. The unwanted recoding step was removed.
- Missingnes criteria was adjust for Life Events measures (`mh_y_ple`, 
  `mh_p_ple`).



# ABCDscores 6.1.0

Date: 2025-11-30

## Changes

- Change maintainer to Le.
- Added citation.

## Bug fixes

- Fixed an error in the following utility functions: `ss_sum`, `ss_mean`, 
  `ss_max`, `ss_count_cond`, `ss_mean_pos`. Fix: If input columns are factors,
  coerce them to numeric (factor -> character -> numeric) prior to 
  computing the summary statistic. Previously, the coercion was inaccurate
  (factor -> numeric), converting the levels to numbers and not the displayed
  labels. For example, non-responses such as 777 (displayed label) could be 
  level 6 for a factor / ordinal column. 
  NOTE: This bug did not affect computed summary scores in 6.0.
- Fixed a bug in the `compute_ph_y_mctq__fd__sleep__mid` 24h and 36h where
  incorrectly used`ph_y_mctq__sd__sleep_dur` than `ph_y_mctq__sd__sleep_period`.
- Fixed a bug in the `compute_ph_y_mctq__fd__sleep__mid` 24h and 36h where
  incorrectly used `ph_y_mctq__fd__sleep_dur` than `ph_y_mctq__fd__sleep_period`.
- Fixed a bug in the `ph_y_mctq__sleep_loss` where incorrectly used 
  `ph_y_mctq__*__sleep_dur` than `ph_y_mctq__*__sleep_period`.
- Fixed `compute_ph_y_mctq__sd_count` to handle missing variables. `ph_y_mctq__school_001__v01`
  and `ph_y_mctq__school_001__01__v1` were required by the function but not available
  before 7.0.0. Now, before package version 7.0.0, if these variables are missing,
  the function will create them internally and fill them with `NA` values. 
  After 7.0.0, these variables are expected to be present.

# ABCDscores 6.0.1

Date: 2025-08-21

## New features

- Added `ph_ph_sds` (Sleep Disturbance Scale) scores. 
- Improved documentation of summary scores by providing information  
  about excluded values, validation criteria, and other notes for all scores.

## Bug fixes

- Fixed an error in the computation of all 3mo TLFB summary scores where 
  incorrectly 60 instead of 90 days were used to compute the scores.

# ABCDscores 6.0.0

Date: 2025-06-27

## New features

The initial release of the ABCDscores package. This version is accompanied
with the ABCD 6.0 data release.
