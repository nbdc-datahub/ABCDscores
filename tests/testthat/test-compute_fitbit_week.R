# Tests for the weekly Fitbit wrappers compute_fitbit_activity_week() and
# compute_fitbit_sleep_week(): the default filter_expr is evaluated within
# the daily data, and the selected output columns exist.
#
# One participant-week of 7 days: days 1-5 are weekdays, days 6-7 weekend.
# Day 7 fails QC and carries extreme values, so any expected value below
# that includes it would be far off. Valid days: 5 weekdays + 1 weekend day.

dtt_bed <- as.POSIXct("2024-01-01 22:00:00", tz = "UTC") + (0:6) * 86400

df_activity_day <- tibble::tibble(
  participant_id = "sub-01", session_id = "ses-03A", wk = 1L,
  dt_wknd = c(rep(FALSE, 5), TRUE, TRUE),
  qc_600min = TRUE,
  qc_steps = c(rep(TRUE, 6), FALSE),
  min_actv = 900, min_slp = 480,
  steps_actv = c(1000, 2000, 3000, 4000, 5000, 6000, 99999),
  steps_fitb = 8000, mets_actv = 15,
  min_intnst_sed_actv = 600, min_intnst_light_actv = 200,
  min_intnst_mod_actv = 60, min_intnst_vigor_actv = 40,
  hrate_rest_fitb = 62
)

df_sleep_day <- tibble::tibble(
  participant_id = "sub-01", session_id = "ses-03A", wk = 1L,
  dt_wknd = c(rep(FALSE, 5), TRUE, TRUE),
  qc_300min = c(rep(TRUE, 6), FALSE),
  dtt_start_bed = dtt_bed, dtt_end_bed = dtt_bed + 9 * 3600,
  dtt_start_slp = dtt_bed + 600, dtt_end_slp = dtt_bed + 8.5 * 3600,
  min_total_slp = 480, min_asleep_slp = 450,
  min_restless_slp = c(rep(30, 5), 60, 999),
  min_light_slp = 250, min_deep_slp = 90, min_rem_slp = 110,
  min_wake = c(rep(30, 5), 60, 999), min_waso = 20, n_waso = 3,
  hrate_awake_slp = c(rep(70, 5), 64, 200),
  hrate_restless_slp = 65, hrate_asleep_slp = 60,
  hrate_light_slp = 61, hrate_deep_slp = 55, hrate_rem_slp = 63
)

test_that("compute_fitbit_activity_week applies the default filter_expr", {
  out <- compute_fitbit_activity_week(df_activity_day)
  whole <- out[out$wk_type == "2", ]
  expect_equal(nrow(out), 3)
  expect_equal(whole$n_day, 6)
  # mean of days 1-6
  expect_equal(whole$mean_steps_actv, 3500)
  expect_equal(out$mean_steps_actv[out$wk_type == "0"], 3000)
  expect_equal(out$mean_steps_actv[out$wk_type == "1"], 6000)
})

test_that("compute_fitbit_sleep_week applies the default filter_expr", {
  out <- compute_fitbit_sleep_week(df_sleep_day)
  whole <- out[out$wk_type == "2", ]
  expect_equal(nrow(out), 3)
  expect_equal(whole$n_day, 6)
  expect_true(whole$qc_wk)
  # (5 * 30 + 60) / 6
  expect_equal(whole$mean_min_restless_slp, 35)
  # minutes-weighted: (5 * 30 * 70 + 60 * 64) / 210 = 68.29, rounded to 68.3
  expect_equal(whole$mean_hrate_awake_slp, 68.3)
})

test_that("compute_fitbit_sleep_week accepts an explicit filter_expr", {
  out <- compute_fitbit_sleep_week(df_sleep_day, filter_expr = !dt_wknd)
  whole <- out[out$wk_type == "2", ]
  expect_equal(whole$n_day, 5)
  expect_equal(whole$mean_min_restless_slp, 30)
  expect_equal(whole$mean_hrate_awake_slp, 70)
})
