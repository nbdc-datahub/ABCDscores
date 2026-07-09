# Tests for the SUI (Substance Use Interview) date-based scores:
# compute_su_y_sui__onset_useage(), compute_su_y_sui__reg_useage(), and
# compute_su_y_sui__last__day_count().
#
# All expected values are hand-derived from the compute_age() semantics
# (lubridate::interval(start, end) divided by a period, i.e. the number of
# complete calendar periods plus the elapsed fraction of the next period).
# The substance date columns are Date-typed, so the "777"/"999" non-response
# codes used elsewhere in the package do not apply here; non-response is
# represented by NA dates.

df_sui <- tibble::tribble(
  ~participant_id, ~session_id, ~ab_g_stc__cohort_dob,
  ~su_y_sui__alc__onset_dt, ~su_y_sui__alc__reg_dt,
  ~ab_g_dyn__visit_dtt, ~su_y_sui__alc__last_dt,
  # sub-01: onset and regular use reported, two sessions (dob is static)
  "sub-01", "ses-02A", as.Date("2008-03-15"),
  as.Date("2020-03-15"), as.Date("2021-03-15"),
  as.POSIXct("2022-03-20 10:30:00", tz = "UTC"), as.Date("2022-03-10"),
  "sub-01", "ses-03A", as.Date("2008-03-15"),
  as.Date("2020-03-15"), as.Date("2021-03-15"),
  as.POSIXct("2023-03-25 09:00:00", tz = "UTC"), as.Date("2023-03-20"),
  # sub-02: never used, all substance dates missing
  "sub-02", "ses-02A", as.Date("2009-06-01"),
  as.Date(NA), as.Date(NA),
  as.POSIXct("2022-06-10 12:00:00", tz = "UTC"), as.Date(NA),
  # sub-03: fractional onset age, no regular use, last use on the visit day
  "sub-03", "ses-02A", as.Date("2010-01-01"),
  as.Date("2015-07-01"), as.Date(NA),
  as.POSIXct("2022-01-05 08:00:00", tz = "UTC"), as.Date("2022-01-05"),
  # sub-04: substance dates present but date of birth missing
  "sub-04", "ses-02A", as.Date(NA),
  as.Date("2020-01-01"), as.Date("2020-06-01"),
  as.POSIXct("2022-01-05 08:00:00", tz = "UTC"), as.Date("2021-12-31")
)

test_that("compute_su_y_sui__onset_useage computes onset age in years", {
  out <- compute_su_y_sui__onset_useage(
    df_sui,
    name = "su_y_sui__alc__onset_useage",
    substance = "alc"
  )
  # sub-01: 2008-03-15 -> 2020-03-15 is exactly 12 calendar years (both rows,
  #   the score is row-wise and dob/onset date are static).
  # sub-03: 2010-01-01 -> 2015-07-01 is 5 complete years (to 2015-01-01) plus
  #   181 days (Jan-Jun 2015) out of the 365 days of 2015 -> 5 + 181/365.
  expect_equal(
    out$su_y_sui__alc__onset_useage,
    c(12, 12, NA, 5 + 181 / 365, NA)
  )
  expect_type(out$su_y_sui__alc__onset_useage, "double")
})

test_that("compute_su_y_sui__onset_useage returns NA for missing dates", {
  out <- compute_su_y_sui__onset_useage(
    df_sui,
    name = "onset_age",
    substance = "alc"
  )
  # sub-02: no onset date reported (never used) -> NA
  expect_true(is.na(out$onset_age[out$participant_id == "sub-02"]))
  # sub-04: onset date present but date of birth missing -> NA
  expect_true(is.na(out$onset_age[out$participant_id == "sub-04"]))
})

test_that("compute_su_y_sui__onset_useage combine argument works", {
  out_only <- compute_su_y_sui__onset_useage(
    df_sui,
    name = "onset_age",
    substance = "alc",
    combine = FALSE
  )
  expect_named(out_only, "onset_age")
  expect_equal(nrow(out_only), nrow(df_sui))

  out_full <- compute_su_y_sui__onset_useage(
    df_sui,
    name = "onset_age",
    substance = "alc"
  )
  # combine = TRUE (default) appends the score and keeps the input unchanged
  expect_identical(out_full[names(df_sui)], df_sui)
  expect_named(out_full, c(names(df_sui), "onset_age"))
})

test_that("compute_su_y_sui__onset_useage validates its arguments", {
  # substance not in sui_substances (and no matching __onset_dt column)
  expect_error(
    compute_su_y_sui__onset_useage(df_sui, name = "x", substance = "coffee")
  )
  # output name already present in the data
  expect_error(
    compute_su_y_sui__onset_useage(
      df_sui,
      name = "participant_id",
      substance = "alc"
    )
  )
  # required date-of-birth column missing
  expect_error(
    compute_su_y_sui__onset_useage(
      df_sui[setdiff(names(df_sui), "ab_g_stc__cohort_dob")],
      name = "onset_age",
      substance = "alc"
    )
  )
})

test_that("compute_su_y_sui__reg_useage computes regular-use age in years", {
  out <- compute_su_y_sui__reg_useage(
    df_sui,
    name = "reg_age",
    substance = "alc"
  )
  # sub-01: 2008-03-15 -> 2021-03-15 is exactly 13 calendar years.
  # sub-02 and sub-03: no regular-use date -> NA; sub-04: missing dob -> NA.
  expect_equal(out$reg_age, c(13, 13, NA, NA, NA))
  expect_type(out$reg_age, "double")
})

test_that("compute_su_y_sui__reg_useage combine and validation work", {
  out_only <- compute_su_y_sui__reg_useage(
    df_sui,
    name = "reg_age",
    substance = "alc",
    combine = FALSE
  )
  expect_named(out_only, "reg_age")
  expect_equal(nrow(out_only), nrow(df_sui))

  expect_error(
    compute_su_y_sui__reg_useage(df_sui, name = "x", substance = "coffee")
  )
  expect_error(
    compute_su_y_sui__reg_useage(
      df_sui,
      name = "session_id",
      substance = "alc"
    )
  )
})

test_that("compute_su_y_sui__last__day_count counts days since last use", {
  out <- compute_su_y_sui__last__day_count(
    df_sui,
    name = "last_days",
    substance = "alc"
  )
  # The visit datetime is truncated to a date before the difference is taken:
  # sub-01 ses-02A: 2022-03-10 -> 2022-03-20 = 10 days (10:30 time ignored)
  # sub-01 ses-03A: 2023-03-20 -> 2023-03-25 = 5 days
  # sub-03: last use on the day of the visit -> 0 days
  # sub-04: 2021-12-31 -> 2022-01-05 = 5 days (crosses year boundary)
  expect_equal(out$last_days, c(10L, 5L, NA, 0L, 5L))
  expect_type(out$last_days, "integer")
})

test_that("compute_su_y_sui__last__day_count NA and validation behavior", {
  out <- compute_su_y_sui__last__day_count(
    df_sui,
    name = "last_days",
    substance = "alc",
    combine = FALSE
  )
  expect_named(out, "last_days")
  # sub-02 never used the substance -> NA (integer)
  expect_identical(out$last_days[3], NA_integer_)

  # required visit datetime column missing
  expect_error(
    compute_su_y_sui__last__day_count(
      df_sui[setdiff(names(df_sui), "ab_g_dyn__visit_dtt")],
      name = "last_days",
      substance = "alc"
    )
  )
  expect_error(
    compute_su_y_sui__last__day_count(df_sui, name = "x", substance = "coffee")
  )
})
