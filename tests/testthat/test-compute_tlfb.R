# Tests for the generic TLFB (Timeline Follow-Back) engine functions in
# R/scores_su_tlfb_sui_sdsu.R. All expected values are derived by hand from
# the roxygen documentation and the source code; derivations are documented
# in comments above the expectations.

# Main fixture: one TLFB interview (ses-01) per participant, dt_tlfb =
# 2024-03-01 (a Friday) for everyone. dt_use_wknd flags Saturdays/Sundays.
#
# sub-01 (M): four Alcohol use days (2024-02-28 Wed qty 2; 2024-02-24 Sat
#   qty 6; 2024-01-15 Mon qty 3; 2023-06-10 Sat qty 1, estimated period)
#   plus one Tobacco Cigarette day co-occurring with Alcohol on 2024-02-28
#   (qty 5).
# sub-02 (F): a single Alcohol use day long before the interview
#   (2023-12-01 Fri, qty 4).
# sub-03 (M): marijuana in two forms (Smoking Marijuana Flower on
#   2024-02-20 Tue qty 4 and 2024-02-10 Sat qty 2; Vaped Marijuana Oils or
#   Concentrates on 2024-02-20 qty 2) plus one Cigars day (2024-02-15 Thu,
#   qty 1). No Alcohol at all.
tlfb_data <- tibble::tribble(
  ~participant_id, ~session_id, ~sex, ~substance,
  ~dt_use, ~dt_tlfb, ~period, ~dt_use_wknd, ~quantity,
  "sub-01", "ses-01", "M", "Alcohol",
  as.Date("2024-02-28"), as.Date("2024-03-01"), "detailed", FALSE, 2,
  "sub-01", "ses-01", "M", "Alcohol",
  as.Date("2024-02-24"), as.Date("2024-03-01"), "detailed", TRUE, 6,
  "sub-01", "ses-01", "M", "Alcohol",
  as.Date("2024-01-15"), as.Date("2024-03-01"), "detailed", FALSE, 3,
  "sub-01", "ses-01", "M", "Alcohol",
  as.Date("2023-06-10"), as.Date("2024-03-01"), "estimated", TRUE, 1,
  "sub-01", "ses-01", "M", "Tobacco Cigarette",
  as.Date("2024-02-28"), as.Date("2024-03-01"), "detailed", FALSE, 5,
  "sub-02", "ses-01", "F", "Alcohol",
  as.Date("2023-12-01"), as.Date("2024-03-01"), "detailed", FALSE, 4,
  "sub-03", "ses-01", "M", "Smoking Marijuana Flower",
  as.Date("2024-02-20"), as.Date("2024-03-01"), "detailed", FALSE, 4,
  "sub-03", "ses-01", "M", "Vaped Marijuana Oils or Concentrates",
  as.Date("2024-02-20"), as.Date("2024-03-01"), "detailed", FALSE, 2,
  "sub-03", "ses-01", "M", "Smoking Marijuana Flower",
  as.Date("2024-02-10"), as.Date("2024-03-01"), "detailed", TRUE, 2,
  "sub-03", "ses-01", "M", "Cigars, Little Cigars, or Cigarillos",
  as.Date("2024-02-15"), as.Date("2024-03-01"), "detailed", FALSE, 1
)

# Multi-event fixture for the cumulative lifetime score: sub-01 has two TLFB
# interviews (ses-01 and ses-02), sub-02 only one.
tlfb_multi <- tibble::tribble(
  ~participant_id, ~session_id, ~sex, ~substance,
  ~dt_use, ~dt_tlfb, ~period, ~dt_use_wknd, ~quantity,
  "sub-01", "ses-01A", "M", "Alcohol",
  as.Date("2024-02-20"), as.Date("2024-03-01"), "detailed", FALSE, 2,
  "sub-01", "ses-01A", "M", "Alcohol",
  as.Date("2024-02-25"), as.Date("2024-03-01"), "detailed", TRUE, 3,
  "sub-02", "ses-01A", "F", "Alcohol",
  as.Date("2024-02-22"), as.Date("2024-03-01"), "detailed", FALSE, 1,
  "sub-01", "ses-02A", "M", "Alcohol",
  as.Date("2024-08-15"), as.Date("2024-09-01"), "detailed", FALSE, 4
)


# compute_tlfb_abst -----------------------------------------------------

test_that("compute_tlfb_abst computes days since last use per participant", {
  out <- compute_tlfb_abst(tlfb_data, name = "abst", substance = "Alcohol")
  # sub-01: dt_tlfb 2024-03-01 minus last Alcohol use 2024-02-28 = 2 days.
  # sub-02: 2024-03-01 minus 2023-12-01 = 30 (rest of Dec) + 31 (Jan) +
  #   29 (Feb 2024, leap year) + 1 (Mar 1) = 91 days.
  expect_named(out, c("participant_id", "session_id", "abst"))
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$abst, c(2L, 91L))
  expect_type(out$abst, "integer")
})

test_that("compute_tlfb_abst drops participants who never used the substance", {
  out <- compute_tlfb_abst(tlfb_data, name = "abst", substance = "Alcohol")
  # sub-03 has no Alcohol rows, so it is absent from the output rather than
  # being reported with an NA score.
  expect_false("sub-03" %in% out$participant_id)
  expect_equal(nrow(out), 2)
})

test_that("compute_tlfb_abst respects the period filter", {
  out <- compute_tlfb_abst(
    tlfb_data,
    name = "abst", substance = "Alcohol", period = "estimated"
  )
  # Only sub-01 has an estimated-period Alcohol row (2023-06-10). Abstinence
  # to 2024-03-01: 20 (rest of Jun) + 31 + 31 + 30 + 31 + 30 + 31 (Jul-Dec) +
  # 31 (Jan) + 29 (Feb) + 1 (Mar 1) = 265 days.
  expect_equal(out$participant_id, "sub-01")
  expect_equal(out$abst, 265L)
})

test_that("compute_tlfb_abst supports scalar and sex-specific binge filters", {
  # Scalar threshold 5: only sub-01's qty-6 day (2024-02-24) qualifies;
  # abstinence = 2024-03-01 - 2024-02-24 = 6 days. sub-02 (max qty 4) drops.
  out <- compute_tlfb_abst(
    tlfb_data,
    name = "abst", substance = "Alcohol", binge = 5
  )
  expect_equal(out$participant_id, "sub-01")
  expect_equal(out$abst, 6L)

  # Sex-specific thresholds F = 4 / M = 5: sub-01 (M) again only via the
  # qty-6 day (abst 6); sub-02 (F) now qualifies with qty 4 (abst 91).
  out2 <- compute_tlfb_abst(
    tlfb_data,
    name = "abst", substance = "Alcohol", binge = list("F" = 4, "M" = 5)
  )
  expect_equal(out2$participant_id, c("sub-01", "sub-02"))
  expect_equal(out2$abst, c(6L, 91L))
})

test_that("compute_tlfb_abst returns an empty tibble when nothing matches", {
  out <- compute_tlfb_abst(tlfb_data, name = "abst", substance = "Salvia")
  expect_s3_class(out, "tbl_df")
  expect_named(out, c("participant_id", "session_id", "abst"))
  expect_equal(nrow(out), 0)
})


# compute_tlfb_dt -------------------------------------------------------

test_that("compute_tlfb_dt returns first and last use dates", {
  first <- compute_tlfb_dt(
    tlfb_data,
    name = "dt", substance = "Alcohol", position = "first"
  )
  last <- compute_tlfb_dt(
    tlfb_data,
    name = "dt", substance = "Alcohol", position = "last"
  )
  expect_named(first, c("participant_id", "session_id", "dt"))
  expect_s3_class(first$dt, "Date")
  # sub-01 Alcohol dates span 2023-06-10 .. 2024-02-28; sub-02 has a single
  # use day, so first == last == 2023-12-01.
  expect_equal(first$dt, as.Date(c("2023-06-10", "2023-12-01")))
  expect_equal(last$dt, as.Date(c("2024-02-28", "2023-12-01")))
})

test_that("compute_tlfb_dt days filter is inclusive of the boundary day", {
  out <- compute_tlfb_dt(
    tlfb_data,
    name = "dt", substance = "Alcohol", days = 30, position = "first"
  )
  # Window: dt_use >= 2024-03-01 - 30 = 2024-01-31. For sub-01 that keeps
  # 2024-02-24 and 2024-02-28, so the first use is 2024-02-24. sub-02's only
  # use (2023-12-01) is outside the window and the participant drops out.
  expect_equal(out$participant_id, "sub-01")
  expect_equal(out$dt, as.Date("2024-02-24"))
})

test_that("compute_tlfb_dt restricts to co-use days", {
  out <- compute_tlfb_dt(
    tlfb_data,
    name = "dt", substance = "Alcohol",
    co_use = "Tobacco Cigarette", position = "first"
  )
  # The co-use filter keeps only participant/session/day groups where a
  # co-use substance appears. sub-01 used Tobacco Cigarettes only on
  # 2024-02-28 (an Alcohol day), so that is both first and last. sub-02 and
  # sub-03 never used tobacco cigarettes and drop out.
  expect_equal(out$participant_id, "sub-01")
  expect_equal(out$dt, as.Date("2024-02-28"))
})

test_that("compute_tlfb_dt validates the position argument", {
  expect_error(compute_tlfb_dt(tlfb_data, name = "dt", substance = "Alcohol"))
  expect_error(
    compute_tlfb_dt(
      tlfb_data,
      name = "dt", substance = "Alcohol", position = "middle"
    )
  )
})


# compute_tlfb_maxdose --------------------------------------------------

test_that("compute_tlfb_maxdose returns the maximum single-day quantity", {
  out <- compute_tlfb_maxdose(tlfb_data, name = "maxdose", substance = "Alcohol")
  # sub-01: max(2, 6, 3, 1) = 6; sub-02: 4.
  expect_named(out, c("participant_id", "session_id", "maxdose"))
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$maxdose, c(6, 4))
})

test_that("compute_tlfb_maxdose filters weekend vs. week days", {
  # wknd = TRUE keeps Saturdays/Sundays only: sub-01 max(6, 1) = 6; sub-02
  # has no weekend use and drops out.
  wknd <- compute_tlfb_maxdose(
    tlfb_data,
    name = "maxdose", substance = "Alcohol", wknd = TRUE
  )
  expect_equal(wknd$participant_id, "sub-01")
  expect_equal(wknd$maxdose, 6)

  # wknd = FALSE keeps week days only: sub-01 max(2, 3) = 3; sub-02: 4.
  wkdy <- compute_tlfb_maxdose(
    tlfb_data,
    name = "maxdose", substance = "Alcohol", wknd = FALSE
  )
  expect_equal(wkdy$participant_id, c("sub-01", "sub-02"))
  expect_equal(wkdy$maxdose, c(3, 4))
})

test_that("compute_tlfb_maxdose applies standard factors for combined marijuana", {
  out <- compute_tlfb_maxdose(
    tlfb_data,
    name = "maxdose", substance = "Marijuana (all forms)"
  )
  # Combined per-day totals for sub-03:
  #   2024-02-20: flower 4 * 0.5 + vaped oils 2 * 1 = 4;
  #   2024-02-10: flower 2 * 0.5 = 1.
  # max over the daily summed doses = 4.
  expect_equal(out$participant_id, "sub-03")
  expect_equal(out$maxdose, 4)
})


# compute_tlfb_mean -----------------------------------------------------

test_that("compute_tlfb_mean divides total quantity by distinct use days", {
  out <- compute_tlfb_mean(tlfb_data, name = "mean", substance = "Alcohol")
  # sub-01: (2 + 6 + 3 + 1) / 4 days = 3; sub-02: 4 / 1 = 4.
  expect_named(out, c("participant_id", "session_id", "mean"))
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$mean, c(3, 4))
})

test_that("compute_tlfb_mean rounds to three decimals", {
  out <- compute_tlfb_mean(
    tlfb_data,
    name = "mean", substance = "Alcohol", period = "detailed"
  )
  # sub-01 detailed rows: (2 + 6 + 3) / 3 days = 3.666... -> round(., 3) =
  # 3.667. sub-02: 4 / 1 = 4.
  expect_equal(out$mean, c(3.667, 4))
})

test_that("compute_tlfb_mean counts a multi-substance day once", {
  out <- compute_tlfb_mean(
    tlfb_data |> dplyr::filter(participant_id == "sub-01"),
    name = "mean"
  )
  # With substance = NULL all rows count: quantities sum to
  # 2 + 6 + 3 + 1 + 5 = 17, but 2024-02-28 hosts both Alcohol and Tobacco,
  # so n_distinct(dt_use) = 4 -> 17 / 4 = 4.25.
  expect_equal(out$mean, 4.25)
})

test_that("compute_tlfb_mean sums combined marijuana quantities per day", {
  out <- compute_tlfb_mean(
    tlfb_data,
    name = "mean", substance = "Marijuana (all forms)"
  )
  # Converted quantities 2 + 2 + 1 = 5 over 2 distinct days = 2.5.
  expect_equal(out$participant_id, "sub-03")
  expect_equal(out$mean, 2.5)
})

test_that("compute_tlfb_mean returns an empty tibble when nothing matches", {
  out <- compute_tlfb_mean(tlfb_data, name = "mean", substance = "Salvia")
  expect_named(out, c("participant_id", "session_id", "mean"))
  expect_equal(nrow(out), 0)
})


# compute_tlfb_totdose --------------------------------------------------

test_that("compute_tlfb_totdose sums quantities over all use days", {
  out <- compute_tlfb_totdose(tlfb_data, name = "totdose", substance = "Alcohol")
  # sub-01: 2 + 6 + 3 + 1 = 12; sub-02: 4.
  expect_named(out, c("participant_id", "session_id", "totdose"))
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$totdose, c(12, 4))
})

test_that("compute_tlfb_totdose converts combined nicotine with standard factors", {
  out <- compute_tlfb_totdose(
    tlfb_data,
    name = "totdose", substance = "Nicotine (all forms)"
  )
  # sub-01: Tobacco Cigarette qty 5 * factor 1 = 5.
  # sub-03: Cigars qty 1 * factor 14 = 14.
  expect_equal(out$participant_id, c("sub-01", "sub-03"))
  expect_equal(out$totdose, c(5, 14))
})

test_that("compute_tlfb_totdose leaves single-form marijuana unconverted", {
  out <- compute_tlfb_totdose(
    tlfb_data,
    name = "totdose", substance = "Smoking Marijuana Flower"
  )
  # Raw quantities without standard factors: 4 + 2 = 6.
  expect_equal(out$participant_id, "sub-03")
  expect_equal(out$totdose, 6)
})

test_that("compute_tlfb_totdose supports sex-specific binge thresholds", {
  out <- compute_tlfb_totdose(
    tlfb_data,
    name = "totdose", substance = "Alcohol", binge = list("F" = 4, "M" = 5)
  )
  # sub-01 (M, threshold 5): only the qty-6 day counts -> 6.
  # sub-02 (F, threshold 4): the qty-4 day counts -> 4.
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$totdose, c(6, 4))
})

test_that("compute_tlfb_totdose returns an empty tibble when nothing matches", {
  out <- compute_tlfb_totdose(tlfb_data, name = "totdose", substance = "Salvia")
  expect_named(out, c("participant_id", "session_id", "totdose"))
  expect_equal(nrow(out), 0)
})


# compute_tlfb_totdose_sum ----------------------------------------------

test_that("compute_tlfb_totdose_sum accumulates the total dose across events", {
  out <- compute_tlfb_totdose_sum(
    tlfb_multi,
    name = "totdose_sum", substance = "Alcohol"
  )
  # Per-event totals: sub-01/ses-01A = 2 + 3 = 5; sub-01/ses-02A = 4;
  # sub-02/ses-01A = 1. Output is sorted by participant and chronological
  # session order, and the cumulative sum runs within each participant, so
  # sub-01/ses-02A = 5 + 4 = 9.
  expect_named(out, c("participant_id", "session_id", "totdose_sum"))
  expect_equal(out$participant_id, c("sub-01", "sub-01", "sub-02"))
  expect_equal(out$session_id, c("ses-01A", "ses-02A", "ses-01A"))
  expect_equal(out$totdose_sum, c(5, 9, 1))
})

test_that("compute_tlfb_totdose_sum is chronological for unsorted input", {
  # regression: the cumulative sum used to follow input row order; a later
  # session listed first must still accumulate after the earlier one
  shuffled <- tlfb_multi[c(4, 3, 2, 1), ]
  out <- compute_tlfb_totdose_sum(
    shuffled,
    name = "totdose_sum", substance = "Alcohol"
  )
  expect_equal(out$participant_id, c("sub-01", "sub-01", "sub-02"))
  expect_equal(out$session_id, c("ses-01A", "ses-02A", "ses-01A"))
  expect_equal(out$totdose_sum, c(5, 9, 1))
})

test_that("compute_tlfb_totdose_sum equals totdose for single-event participants", {
  single <- tlfb_multi |> dplyr::filter(session_id == "ses-01A")
  out <- compute_tlfb_totdose_sum(
    single,
    name = "totdose_sum", substance = "Alcohol"
  )
  # With one event per participant the cumulative sum is the event total.
  expect_equal(out$totdose_sum, c(5, 1))
})

test_that("compute_tlfb_totdose_sum drops the intermediate helper column", {
  out <- compute_tlfb_totdose_sum(
    tlfb_multi,
    name = "totdose_sum", substance = "Alcohol"
  )
  expect_false("tlfb_totdose" %in% names(out))
  expect_false("session_num" %in% names(out))
  expect_false(dplyr::is_grouped_df(out))
})


# compute_tlfb_ud -------------------------------------------------------

test_that("compute_tlfb_ud counts distinct use days as integer", {
  out <- compute_tlfb_ud(tlfb_data, name = "ud", substance = "Alcohol")
  # sub-01: 4 distinct Alcohol days; sub-02: 1.
  expect_named(out, c("participant_id", "session_id", "ud"))
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$ud, c(4L, 1L))
  expect_type(out$ud, "integer")
})

test_that("compute_tlfb_ud counts a day with two substances once", {
  out <- compute_tlfb_ud(
    tlfb_data,
    name = "ud", substance = c("Alcohol", "Tobacco Cigarette")
  )
  # sub-01's Tobacco day (2024-02-28) coincides with an Alcohol day, so the
  # distinct-day count stays 4.
  expect_equal(out$participant_id, c("sub-01", "sub-02"))
  expect_equal(out$ud, c(4L, 1L))
})

test_that("compute_tlfb_ud days window includes the boundary day", {
  out <- compute_tlfb_ud(
    tlfb_data,
    name = "ud", substance = "Alcohol", days = 6
  )
  # Window: dt_use >= 2024-03-01 - 6 = 2024-02-24; the filter is >=, so the
  # 2024-02-24 use day itself is included -> sub-01 has 2 days in window.
  expect_equal(out$participant_id, "sub-01")
  expect_equal(out$ud, 2L)
})

test_that("compute_tlfb_ud filters weekends and combined substances", {
  wknd <- compute_tlfb_ud(
    tlfb_data,
    name = "ud", substance = "Alcohol", wknd = TRUE
  )
  # sub-01 weekend Alcohol days: 2024-02-24 and 2023-06-10.
  expect_equal(wknd$participant_id, "sub-01")
  expect_equal(wknd$ud, 2L)

  mj <- compute_tlfb_ud(
    tlfb_data,
    name = "ud", substance = "Marijuana (all forms)"
  )
  # sub-03's combined marijuana rows fall on 2 distinct days (2024-02-20
  # twice, 2024-02-10 once).
  expect_equal(mj$participant_id, "sub-03")
  expect_equal(mj$ud, 2L)
})


# Argument validation (check_args_tlfb via the compute functions) --------

test_that("TLFB functions reject invalid argument combinations", {
  # period and days are mutually exclusive
  expect_error(
    compute_tlfb_ud(
      tlfb_data,
      name = "ud", substance = "Alcohol", period = "detailed", days = 30
    ),
    "period.*days|days.*period"
  )
  # co_use requires substance
  expect_error(
    compute_tlfb_ud(tlfb_data, name = "ud", co_use = "Alcohol"),
    "substance"
  )
  # co_use must not overlap substance
  expect_error(
    compute_tlfb_ud(
      tlfb_data,
      name = "ud", substance = "Alcohol", co_use = "Alcohol"
    ),
    "co_use"
  )
  # substance must be a known TLFB substance
  expect_error(
    compute_tlfb_ud(tlfb_data, name = "ud", substance = "Coffee")
  )
  # name must not already exist in the data
  expect_error(
    compute_tlfb_ud(tlfb_data, name = "quantity", substance = "Alcohol"),
    "quantity"
  )
})
