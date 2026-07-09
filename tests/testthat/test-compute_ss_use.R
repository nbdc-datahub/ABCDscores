# Tests for the SDSU (Static and Dynamic Substance Use) engine:
# prepare_data_sdsu(), map_mid_years(), check_args_sdsu(),
# compute_ss_use_yn(), compute_ss_use_onset_event(), and
# compute_ss_use_onset_age().
#
# Most tests use the substance "Alcohol (Sipping)" because its variable set is
# small (three items, has_age_fu = FALSE):
#   su_y_sui__use__alc__sip_001, su_y_sui__use__alc__sip_001__l,
#   su_y_mysu__use__alc__sip__6mo_001
# "Alcohol" (has_age_fu = TRUE) exercises the detailed first-use-age branch of
# compute_ss_use_onset_age().
#
# session_id is built as a factor throughout, matching DEAP data.
# compute_ss_use_onset_event() orders sessions via create_session_num(), so
# plain character session ids work as well (covered by a dedicated test).

sip_vars <- c(
  "su_y_sui__use__alc__sip_001",
  "su_y_sui__use__alc__sip_001__l",
  "su_y_mysu__use__alc__sip__6mo_001"
)

sip_sessions <- c("ses-00A", "ses-00M", "ses-01A", "ses-02A")

# Longitudinal fixture fed through prepare_data_sdsu():
# - sub-01: annual visits only, first (and only) sip reported at ses-01A
# - sub-02: never used
# - sub-03: use reported only at the mid-year between ses-00A and ses-01A
#   (value "2", any value > 0 counts as use)
# - sub-04: use reported only at a terminal mid-year (no later annual visit)
# - sub-05: single visit with all substance items missing
raw_sip <- tibble::tribble(
  ~participant_id, ~session_id, ~ab_g_dyn__visit_dtt, ~ab_g_dyn__visit_age,
  ~su_y_mypi_dtt, ~su_y_mypi_age,
  ~su_y_sui__use__alc__sip_001, ~su_y_sui__use__alc__sip_001__l,
  ~su_y_mysu__use__alc__sip__6mo_001,
  "sub-01", "ses-00A", as.Date("2018-01-10"), 10.0, as.Date(NA), NA, "0", NA, NA,
  "sub-01", "ses-01A", as.Date("2019-01-10"), 11.0, as.Date(NA), NA, "1", NA, NA,
  "sub-01", "ses-02A", as.Date("2020-01-10"), 12.0, as.Date(NA), NA, "0", NA, NA,
  "sub-02", "ses-00A", as.Date("2018-02-01"), 9.5, as.Date(NA), NA, "0", "0", NA,
  "sub-02", "ses-01A", as.Date("2019-02-01"), 10.5, as.Date(NA), NA, "0", NA, NA,
  "sub-03", "ses-00A", as.Date("2018-03-05"), 10.2, as.Date(NA), NA, "0", NA, NA,
  "sub-03", "ses-00M", as.Date(NA), NA, as.Date("2018-09-05"), 10.7, NA, NA, "2",
  "sub-03", "ses-01A", as.Date("2019-03-05"), 11.2, as.Date(NA), NA, "0", NA, NA,
  "sub-04", "ses-00A", as.Date("2018-04-01"), 9.8, as.Date(NA), NA, "0", NA, NA,
  "sub-04", "ses-00M", as.Date(NA), NA, as.Date("2018-10-01"), 10.3, NA, "1", NA,
  "sub-05", "ses-00A", as.Date("2018-05-01"), 10.1, as.Date(NA), NA, NA, NA, NA
) |>
  dplyr::mutate(session_id = factor(session_id, levels = sip_sessions))

prep_sip <- prepare_data_sdsu(raw_sip)


# prepare_data_sdsu -----------------------------------------------------

test_that("prepare_data_sdsu derives session type, date, and age", {
  # rows deliberately out of chronological order to test the per-participant
  # sort by (filled) session date
  raw <- tibble::tribble(
    ~participant_id, ~session_id, ~ab_g_dyn__visit_dtt, ~ab_g_dyn__visit_age,
    ~su_y_mypi_dtt, ~su_y_mypi_age,
    "sub-01", "ses-01A", as.Date("2019-01-15"), 11.0, as.Date(NA), NA,
    "sub-01", "ses-00A", as.Date("2018-01-15"), 10.0, as.Date(NA), NA,
    "sub-01", "ses-00M", as.Date(NA), NA, as.Date("2018-07-15"), 10.5,
    "sub-02", "ses-00A", as.Date("2018-02-01"), 9.5, as.Date(NA), NA,
    "sub-02", "ses-00M", as.Date(NA), NA, as.Date("2018-08-01"), 10.0
  )
  prep <- prepare_data_sdsu(raw)

  # rows are sorted by participant, then by session date
  expect_equal(
    prep$session_id,
    c("ses-00A", "ses-00M", "ses-01A", "ses-00A", "ses-00M")
  )
  expect_equal(prep$session_type, c("A", "M", "A", "A", "M"))
  # annual sessions use the visit date/age, mid-year the MYPI date/age
  expect_equal(
    prep$session_date,
    as.Date(c(
      "2018-01-15", "2018-07-15", "2019-01-15", "2018-02-01", "2018-08-01"
    ))
  )
  expect_equal(prep$session_age, c(10.0, 10.5, 11.0, 9.5, 10.0))
  expect_equal(prep$session_date_filled, prep$session_date)
})

test_that("prepare_data_sdsu maps mid-year sessions to the next annual", {
  raw <- tibble::tribble(
    ~participant_id, ~session_id, ~ab_g_dyn__visit_dtt, ~ab_g_dyn__visit_age,
    ~su_y_mypi_dtt, ~su_y_mypi_age,
    "sub-01", "ses-00A", as.Date("2018-01-15"), 10.0, as.Date(NA), NA,
    "sub-01", "ses-00M", as.Date(NA), NA, as.Date("2018-07-15"), 10.5,
    "sub-01", "ses-01A", as.Date("2019-01-15"), 11.0, as.Date(NA), NA,
    "sub-02", "ses-00A", as.Date("2018-02-01"), 9.5, as.Date(NA), NA,
    "sub-02", "ses-00M", as.Date(NA), NA, as.Date("2018-08-01"), 10.0
  )
  prep <- prepare_data_sdsu(raw)

  # sub-01's mid-year maps up to the next observed annual (ses-01A);
  # sub-02's terminal mid-year has no later annual, so it stays NA
  expect_equal(
    prep$session_id_mapped,
    c("ses-00A", "ses-01A", "ses-01A", "ses-00A", NA)
  )
  expect_equal(
    prep$last_session_id,
    c(rep("ses-01A", 3), rep("ses-00M", 2))
  )
  # For the terminal mid-year the forecast is the *next* annual session
  # (ses-00M -> ses-01A), consistent with map_mid_years() and the SDSU
  # vignette convention (ses-01M -> ses-02A).
  expect_equal(
    prep$session_id_mapped_forecast,
    c("ses-00A", "ses-01A", "ses-01A", "ses-00A", "ses-01A")
  )
  # the forecast column never contains NA
  expect_false(anyNA(prep$session_id_mapped_forecast))
})

test_that("prepare_data_sdsu fills missing session dates within participant", {
  raw <- tibble::tribble(
    ~participant_id, ~session_id, ~ab_g_dyn__visit_dtt, ~ab_g_dyn__visit_age,
    ~su_y_mypi_dtt, ~su_y_mypi_age,
    "sub-03", "ses-00A", as.Date("2018-03-01"), 10.0, as.Date(NA), NA,
    "sub-03", "ses-00M", as.Date(NA), NA, as.Date(NA), 10.4
  )
  prep <- prepare_data_sdsu(raw)

  # the mid-year has no MYPI date, so its session_date is NA but the filled
  # date is carried down from the annual visit
  expect_equal(prep$session_date, as.Date(c("2018-03-01", NA)))
  expect_equal(
    prep$session_date_filled,
    as.Date(c("2018-03-01", "2018-03-01"))
  )
})

test_that("prepare_data_sdsu labels unrecognized sessions as UNCATEGORIZED", {
  raw <- tibble::tibble(
    participant_id = "sub-01",
    session_id = "ses-00S",
    ab_g_dyn__visit_dtt = as.Date("2018-01-01"),
    ab_g_dyn__visit_age = 10.0,
    su_y_mypi_dtt = as.Date(NA),
    su_y_mypi_age = NA_real_
  )
  prep <- prepare_data_sdsu(raw)

  # screening sessions are neither annual nor mid-year: no date/age is used
  expect_equal(prep$session_type, "UNCATEGORIZED")
  expect_true(is.na(prep$session_date))
  expect_true(is.na(prep$session_age))
})


# map_mid_years ---------------------------------------------------------

# Minimal hand-built "prepared" data covering all algorithm branches:
# sub-01 has a mid-year followed by an annual; sub-02 ends with a terminal
# mid-year; sub-03 tests the two-digit session increment.
prepped_my <- tibble::tribble(
  ~participant_id, ~session_id, ~session_type,
  ~session_id_mapped, ~session_id_mapped_forecast,
  "sub-01", "ses-00A", "A", "ses-00A", "ses-00A",
  "sub-01", "ses-00M", "M", "ses-01A", "ses-01A",
  "sub-01", "ses-01A", "A", "ses-01A", "ses-01A",
  "sub-02", "ses-00A", "A", "ses-00A", "ses-00A",
  "sub-02", "ses-00M", "M", NA, "ses-00A",
  "sub-03", "ses-09M", "M", "ses-10A", "ses-10A"
)

test_that("map_mid_years next_existing_fy remaps and drops terminal mid-years", {
  out <- map_mid_years(prepped_my, algo = "next_existing_fy")
  # sub-02's terminal mid-year has no existing next annual -> dropped
  expect_equal(nrow(out), 5)
  expect_equal(
    out$session_id,
    c("ses-00A", "ses-01A", "ses-01A", "ses-00A", "ses-10A")
  )
})

test_that("map_mid_years next_potential_fy keeps terminal mid-years", {
  out <- map_mid_years(prepped_my, algo = "next_potential_fy")
  # no rows are dropped and every session id is resolved
  expect_equal(nrow(out), nrow(prepped_my))
  expect_false(anyNA(out$session_id))
  # mid-years with an existing next annual map to it
  expect_equal(out$session_id[2], "ses-01A")
  # annual sessions are unchanged
  expect_equal(out$session_id[c(1, 3, 4)], c("ses-00A", "ses-01A", "ses-00A"))
})

test_that("map_mid_years next_immediate_fy increments the session number", {
  out <- map_mid_years(prepped_my, algo = "next_immediate_fy")
  # ses-00M -> ses-01A and ses-09M -> ses-10A regardless of existing records;
  # annual sessions are unchanged
  expect_equal(
    out$session_id,
    c("ses-00A", "ses-01A", "ses-01A", "ses-00A", "ses-01A", "ses-10A")
  )
  expect_equal(nrow(out), nrow(prepped_my))
})

test_that("map_mid_years remove_my keeps only annual sessions", {
  out <- map_mid_years(prepped_my, algo = "remove_my")
  expect_equal(nrow(out), 3)
  expect_true(all(out$session_type == "A"))
  expect_equal(out$session_id, c("ses-00A", "ses-01A", "ses-00A"))
})

test_that("map_mid_years NULL algo returns the data unchanged", {
  expect_identical(map_mid_years(prepped_my, algo = NULL), prepped_my)
})

test_that("map_mid_years rejects unknown algorithms", {
  expect_error(map_mid_years(prepped_my, algo = "not_an_algo"))
})


# check_args_sdsu -------------------------------------------------------

test_that("check_args_sdsu validates data and name", {
  df <- tibble::tibble(participant_id = "sub-01")
  expect_silent(check_args_sdsu(data = df, name = "new_score"))
  # the output name must not collide with an existing column
  expect_error(check_args_sdsu(data = df, name = "participant_id"))
  expect_error(check_args_sdsu(data = "not a data frame", name = "x"))
})


# compute_ss_use_yn -----------------------------------------------------

test_that("compute_ss_use_yn flags use per session (default algo)", {
  out <- compute_ss_use_yn(
    prep_sip,
    name = "sip_yn",
    substance = "Alcohol (Sipping)"
  )
  # With the default algo = "next_existing_fy":
  # - sub-03's mid-year use record is merged into ses-01A -> 1 there
  # - sub-04's terminal mid-year (the only use) is dropped -> 0 at ses-00A
  # - sub-05's all-missing items count as no use -> 0
  # Groups: sub-01 x3, sub-02 x2, sub-03 x2 (00M merged), sub-04 x1, sub-05 x1
  expect_equal(nrow(out), 9)
  expect_equal(
    out$participant_id,
    c(rep("sub-01", 3), rep("sub-02", 2), rep("sub-03", 2), "sub-04", "sub-05")
  )
  expect_equal(
    as.character(out$session_id),
    c(
      "ses-00A", "ses-01A", "ses-02A",
      "ses-00A", "ses-01A",
      "ses-00A", "ses-01A",
      "ses-00A",
      "ses-00A"
    )
  )
  expect_equal(out$sip_yn, c(0, 1, 0, 0, 0, 0, 1, 0, 0))
})

test_that("compute_ss_use_yn cumulative carries use forward", {
  out <- compute_ss_use_yn(
    prep_sip,
    name = "sip_yn",
    substance = "Alcohol (Sipping)",
    cumulative = TRUE
  )
  # sub-01 used at ses-01A -> 1 at ses-01A and ses-02A (cummax), 0 before
  expect_equal(out$sip_yn, c(0, 1, 1, 0, 0, 0, 1, 0, 0))
})

test_that("compute_ss_use_yn algo = NULL keeps mid-year sessions", {
  out <- compute_ss_use_yn(
    prep_sip,
    name = "sip_yn",
    substance = "Alcohol (Sipping)",
    algo = NULL
  )
  # every observed session keeps its own row (3 + 2 + 3 + 2 + 1 = 11)
  expect_equal(nrow(out), 11)
  # sub-03 and sub-04 show their use at the mid-year itself
  sub03 <- out[out$participant_id == "sub-03", ]
  expect_equal(as.character(sub03$session_id), c("ses-00A", "ses-00M", "ses-01A"))
  expect_equal(sub03$sip_yn, c(0, 1, 0))
  sub04 <- out[out$participant_id == "sub-04", ]
  expect_equal(sub04$sip_yn, c(0, 1))
})

test_that("compute_ss_use_yn algo = remove_my discards mid-year reports", {
  out <- compute_ss_use_yn(
    prep_sip,
    name = "sip_yn",
    substance = "Alcohol (Sipping)",
    algo = "remove_my"
  )
  # mid-year rows are dropped entirely, so sub-03's use disappears
  expect_equal(nrow(out), 9)
  expect_equal(
    out$sip_yn[out$participant_id == "sub-03"],
    c(0, 0)
  )
})

test_that("compute_ss_use_yn returns the documented columns and types", {
  out <- compute_ss_use_yn(
    prep_sip,
    name = "sip_yn",
    substance = "Alcohol (Sipping)"
  )
  expect_named(out, c("participant_id", "session_id", "sip_yn"))
  expect_type(out$sip_yn, "double")
  expect_true(all(out$sip_yn %in% c(0, 1)))
})

test_that("compute_ss_use_yn validates its arguments", {
  # unknown substance
  expect_error(
    compute_ss_use_yn(prep_sip, name = "x", substance = "Coffee")
  )
  # output name collides with an existing column
  expect_error(
    compute_ss_use_yn(
      prep_sip,
      name = "session_type",
      substance = "Alcohol (Sipping)"
    )
  )
  # cumulative must be a flag
  expect_error(
    compute_ss_use_yn(
      prep_sip,
      name = "sip_yn",
      substance = "Alcohol (Sipping)",
      cumulative = "yes"
    )
  )
})


# compute_ss_use_onset_event --------------------------------------------

test_that("compute_ss_use_onset_event returns the earliest use session", {
  # minimal input: with algo = NULL only participant_id, session_id, and the
  # substance items are needed
  data_onset <- tibble::tibble(
    participant_id = c(
      rep("sub-01", 3), rep("sub-02", 2), rep("sub-03", 3), "sub-04"
    ),
    session_id = factor(
      c(
        "ses-00A", "ses-01A", "ses-02A",
        "ses-00A", "ses-01A",
        "ses-00A", "ses-00M", "ses-01A",
        "ses-00A"
      ),
      levels = sip_sessions
    ),
    su_y_sui__use__alc__sip_001 =
      c("0", "1", "1", "0", "0", "0", NA, "0", "1"),
    su_y_sui__use__alc__sip_001__l = NA_character_,
    su_y_mysu__use__alc__sip__6mo_001 =
      c(NA, NA, NA, NA, NA, NA, "1", NA, NA)
  )
  out <- compute_ss_use_onset_event(
    data_onset,
    name = "sip_onset_event",
    substance = "Alcohol (Sipping)"
  )
  # one row per participant:
  # - sub-01 used at ses-01A and ses-02A -> earliest is ses-01A
  # - sub-02 never used -> NA
  # - sub-03's only use is the mid-year itself (algo = NULL keeps it)
  # - sub-04 used at the first session
  expect_equal(nrow(out), 4)
  expect_named(out, c("participant_id", "sip_onset_event"))
  expect_type(out$sip_onset_event, "character")
  expect_equal(
    out$sip_onset_event[match(paste0("sub-0", 1:4), out$participant_id)],
    c("ses-01A", NA, "ses-00M", "ses-00A")
  )

  # regression: character session ids must give the same result as factors
  # (the earliest-session selection used to rely on factor level codes and
  # errored on character input)
  data_chr <- dplyr::mutate(data_onset, session_id = as.character(session_id))
  out_chr <- compute_ss_use_onset_event(
    data_chr,
    name = "sip_onset_event",
    substance = "Alcohol (Sipping)"
  )
  expect_equal(out_chr, out)
})

test_that("compute_ss_use_onset_event applies the mid-year mapping algo", {
  out <- compute_ss_use_onset_event(
    prep_sip,
    name = "sip_onset_event",
    substance = "Alcohol (Sipping)",
    algo = "next_existing_fy"
  )
  # - sub-03's mid-year use is remapped to ses-01A
  # - sub-04's only use is at a terminal mid-year, which this algo drops,
  #   so no onset is observed -> NA
  # - sub-05 has only missing items -> NA (missing counts as no use)
  expect_equal(
    out$sip_onset_event[match(paste0("sub-0", 1:5), out$participant_id)],
    c("ses-01A", NA, "ses-01A", NA, NA)
  )
})

test_that("compute_ss_use_onset_event with algo = NULL keeps mid-year onsets", {
  out <- compute_ss_use_onset_event(
    prep_sip,
    name = "sip_onset_event",
    substance = "Alcohol (Sipping)"
  )
  expect_equal(
    out$sip_onset_event[match(paste0("sub-0", 1:5), out$participant_id)],
    c("ses-01A", NA, "ses-00M", "ses-00M", NA)
  )
})

test_that("compute_ss_use_onset_event validates its arguments", {
  expect_error(
    compute_ss_use_onset_event(prep_sip, name = "x", substance = "Coffee")
  )
  expect_error(
    compute_ss_use_onset_event(
      prep_sip,
      name = "session_type",
      substance = "Alcohol (Sipping)"
    )
  )
})


# compute_ss_use_onset_age ----------------------------------------------

test_that("compute_ss_use_onset_age returns visit age for substances without
           first-use age items", {
  # "Alcohol (Sipping)" has has_age_fu = FALSE, so the score is the session
  # age at the onset session
  out <- compute_ss_use_onset_age(
    prep_sip,
    name = "sip_onset_age",
    substance = "Alcohol (Sipping)"
  )
  expect_named(out, c("participant_id", "sip_onset_age"))
  expect_equal(nrow(out), 5)
  # - sub-01: onset at ses-01A -> visit age 11.0
  # - sub-02: never used -> NA
  # - sub-03: onset at ses-00M (algo = NULL) -> MYPI age 10.7
  # - sub-04: onset at the terminal mid-year -> MYPI age 10.3
  # - sub-05: all items missing -> NA
  expect_equal(
    out$sip_onset_age[match(paste0("sub-0", 1:5), out$participant_id)],
    c(11.0, NA, 10.7, 10.3, NA)
  )
  expect_type(out$sip_onset_age, "double")
})

test_that("compute_ss_use_onset_age prefers the reported first-use age", {
  # "Alcohol" (has_age_fu = TRUE) reads the detailed first-use age from
  # su_y_sui__alc__onset_useage; all six configured alcohol items must be
  # present in the data
  data_alc <- tibble::tibble(
    participant_id = rep(paste0("sub-0", 1:4), each = 2),
    session_id = factor(rep(c("ses-00A", "ses-01A"), 4)),
    session_age = c(10.0, 11.0, 10.1, 11.1, 9.5, 10.5, 9.9, 10.9),
    su_y_tlfb__alc_ud = NA_character_,
    su_y_tlfb__alc__cum_totdose = NA_character_,
    su_y_sui__use__alc_001 = c("0", "1", "0", "0", NA, NA, "0", "0"),
    su_y_sui__use__alc_001__l = NA_character_,
    su_y_mysu__use__alc__6mo_001 = c(NA, NA, NA, NA, "1", "0", NA, NA),
    su_y_mysu__use__alc__6mo_001__v01 = NA_character_,
    su_y_sui__alc__onset_useage = c(NA, 9, NA, NA, NA, NA, 8, NA)
  )
  out <- compute_ss_use_onset_age(
    data_alc,
    name = "alc_onset_age",
    substance = "Alcohol"
  )
  # - sub-01: first use flagged at ses-01A (visit age 11) but a first-use age
  #   of 9 was reported there -> 9 (detailed age wins over visit age)
  # - sub-02: never used and no first-use age -> NA
  # - sub-03: use flagged at ses-00A but no first-use age reported -> falls
  #   back to the visit age at onset, 9.5
  # - sub-04: no use ever flagged, but a first-use age of 8 was reported ->
  #   8 ("age of first use if available", per the docs)
  expect_named(out, c("participant_id", "alc_onset_age"))
  expect_equal(
    out$alc_onset_age[match(paste0("sub-0", 1:4), out$participant_id)],
    c(9, NA, 9.5, 8)
  )
})
