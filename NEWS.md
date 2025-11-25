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
  the function will create them internally and fill them with `NA` values. After 7.0.0,
  these variables are expected to be present.

# ABCDscores 6.0.1

Date: 2025-08-21

## New features

- Added `ph_ph_sds` (Sleep Disturbance Scale) scores. 
- Improved documentation of summary scores by providing information information about 
  excluded values, validation criteria, and other notes for all scores.

## Bug fixes

- Fixed an error in the computation of all 3mo TLFB summary scores where incorrectly 60 
  instead of 90 days were used to compute the scores.

# ABCDscores 6.0.0

Date: 2025-06-27

## New features

The initial release of the ABCDscores package. This version is accompanied
with the ABCD 6.0 data release.
