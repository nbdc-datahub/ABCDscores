# Tests for the family-history endorsement engine and its wrappers
# (R/scores_mh_famhx.R).
#
# Checkbox semantics (compute_famhx_endorsement): the columns
# `{basename}___{option}` are checkbox fields where a cell value of 1 means
# "this option was ticked". combine_checkboxes() collects the ticked option
# numbers per participant/session into a set; the engine then maps that set to
# an indicator:
#   - empty set (nothing ticked, or all cells NA)        -> NA
#   - contains a non-response option (777, 888, or 999)  -> NA
#   - contains option 0 ("none of the above")            -> 0
#   - anything else (a real relative option was ticked)  -> 1
# The non-response and 0 rules are checked before the endorsement default, so
# they win even when an endorsement option is ticked alongside them.
#
# All expected values below are hand-derived from this reading of the code and
# the roxygen docs, never from running the functions.

# Checkbox fixture for the engine: one basename, options 0/1/2 plus the three
# non-response options. Ticked-option sets and hand-derived indicators:
#   sub-01 {1}      -> 1   (endorsed)
#   sub-02 {2}      -> 1   (any non-zero, non-code option endorses)
#   sub-03 {0}      -> 0   ("none of the above")
#   sub-04 {0, 1}   -> 0   (0 rule is checked before the endorsement default)
#   sub-05 {999}    -> NA  (decline to answer)
#   sub-06 {1, 999} -> NA  (999 rule is checked before the endorsement default)
#   sub-07 {}       -> NA  (no box ticked)
#   sub-08 {}       -> NA  (all cells NA)
#   sub-09 {777}    -> NA  (don't know)
#   sub-10 {888}    -> NA  (not administered)
df_engine <- tibble::tibble(
  participant_id = sprintf("sub-%02d", 1:10),
  session_id = "ses-00A",
  mh_p_famhx__alc__fath_001___0 = c(0, 0, 1, 1, 0, 0, 0, NA, 0, 0),
  mh_p_famhx__alc__fath_001___1 = c(1, 0, 0, 1, 0, 1, 0, NA, 0, 0),
  mh_p_famhx__alc__fath_001___2 = c(0, 1, 0, 0, 0, 0, 0, NA, 0, 0),
  mh_p_famhx__alc__fath_001___777 = c(0, 0, 0, 0, 0, 0, 0, NA, 1, 0),
  mh_p_famhx__alc__fath_001___888 = c(0, 0, 0, 0, 0, 0, 0, NA, 0, 1),
  mh_p_famhx__alc__fath_001___999 = c(0, 0, 0, 0, 1, 1, 0, NA, 0, 0)
)

exp_engine <- c(1L, 1L, 0L, 0L, NA, NA, NA, NA, NA, NA)

test_that("compute_famhx_endorsement hand-derived endorsement indicators", {
  out <- compute_famhx_endorsement(
    df_engine,
    name = "mh_p_famhx__alc__fath_indicator",
    var_matches = "mh_p_famhx__alc__fath_001"
  )
  expect_equal(out$mh_p_famhx__alc__fath_indicator, exp_engine)
  expect_true(is.integer(out$mh_p_famhx__alc__fath_indicator))
})

test_that("compute_famhx_endorsement respects the `name` argument", {
  out <- compute_famhx_endorsement(
    df_engine,
    name = "custom_indicator",
    var_matches = "mh_p_famhx__alc__fath_001",
    combine = FALSE
  )
  expect_named(out, "custom_indicator")
  expect_equal(out$custom_indicator, exp_engine)
})

test_that("compute_famhx_endorsement combine controls the output shape", {
  out_combined <- compute_famhx_endorsement(
    df_engine,
    name = "ind",
    var_matches = "mh_p_famhx__alc__fath_001"
  )
  # combine = TRUE appends exactly one column and leaves the input unchanged
  expect_equal(ncol(out_combined), ncol(df_engine) + 1)
  expect_identical(out_combined[names(df_engine)], df_engine)

  out_only <- compute_famhx_endorsement(
    df_engine,
    name = "ind",
    var_matches = "mh_p_famhx__alc__fath_001",
    combine = FALSE
  )
  expect_named(out_only, "ind")
  expect_equal(nrow(out_only), nrow(df_engine))
})

test_that("compute_famhx_endorsement errors when no columns match", {
  df <- tibble::tibble(
    participant_id = "sub-01",
    session_id = "ses-00A",
    unrelated = 1
  )
  # Note: the intended abort message interpolates `vars_matches`, which is a
  # typo for `var_matches` in the source; the call still fails, so we only
  # assert that an error is raised.
  expect_error(
    compute_famhx_endorsement(df, name = "ind", var_matches = "no_such_var")
  )
})

# Wrapper fixture for the alcohol either-parent indicator: father and mother
# checkbox blocks with options 0 (none), 1 (endorse), and 999 (decline).
# Hand-derived parent endorsements (fath, moth) and either-parent indicator:
#   sub-01 (1, 0)   -> 1  (father yes)
#   sub-02 (0, 1)   -> 1  (mother yes)
#   sub-03 (0, 0)   -> 0  (both no)
#   sub-04 (NA, 0)  -> NA (father declined 999, mother no: neither rule fires)
#   sub-05 (NA, 1)  -> 1  (mother yes satisfies the OR despite father's 999)
#   sub-06 (1, 1)   -> 1
#   sub-07 (NA, NA) -> NA (no boxes ticked for either parent)
df_alc <- tibble::tibble(
  participant_id = sprintf("sub-%02d", 1:7),
  session_id = "ses-00A",
  mh_p_famhx__alc__fath_001___0 = c(0, 1, 1, 0, 0, 0, 0),
  mh_p_famhx__alc__fath_001___1 = c(1, 0, 0, 0, 0, 1, 0),
  mh_p_famhx__alc__fath_001___999 = c(0, 0, 0, 1, 1, 0, 0),
  mh_p_famhx__alc__moth_001___0 = c(1, 0, 1, 1, 0, 0, 0),
  mh_p_famhx__alc__moth_001___1 = c(0, 1, 0, 0, 1, 1, 0),
  mh_p_famhx__alc__moth_001___999 = c(0, 0, 0, 0, 0, 0, 0)
)

test_that("compute_mh_p_famhx__alc__moth__fath_indicator either-parent logic", {
  out <- compute_mh_p_famhx__alc__moth__fath_indicator(df_alc)
  # sub-05: father NA (999) but mother yes -> the OR branch fires -> 1
  expect_equal(
    out$mh_p_famhx__alc__moth__fath_indicator,
    c(1L, 1L, 0L, NA, 1L, 1L, NA)
  )
  expect_true(is.integer(out$mh_p_famhx__alc__moth__fath_indicator))
  expect_identical(out[names(df_alc)], df_alc)
})

test_that("compute_mh_p_famhx__alc__moth__fath_indicator combine = FALSE", {
  out <- compute_mh_p_famhx__alc__moth__fath_indicator(df_alc, combine = FALSE)
  expect_named(out, "mh_p_famhx__alc__moth__fath_indicator")
  expect_equal(nrow(out), nrow(df_alc))
})

# The suicide wrapper reads plain (non-checkbox) response columns and recodes
# 777/888/999 to NA before the either-parent logic. Hand derivation
# (fath, moth) -> indicator:
#   (1, 0)     -> 1   (father yes)
#   (0, 1)     -> 1   (mother yes)
#   (0, 0)     -> 0
#   (999, 0)   -> NA  (father NA, mother no: neither rule fires)
#   (777, 1)   -> 1   (mother yes satisfies the OR despite father non-response)
#   (888, 888) -> NA
#   (NA, NA)   -> NA
#   (1, 1)     -> 1
test_that("compute_mh_p_famhx__suic__moth__fath_indicator recodes non-response", {
  df_suic <- tibble::tibble(
    participant_id = sprintf("sub-%02d", 1:8),
    session_id = "ses-00A",
    mh_p_famhx__suic__fath_001 = c(1, 0, 0, 999, 777, 888, NA, 1),
    mh_p_famhx__suic__moth_001 = c(0, 1, 0, 0, 1, 888, NA, 1)
  )
  out <- compute_mh_p_famhx__suic__moth__fath_indicator(df_suic)
  expect_equal(
    out$mh_p_famhx__suic__moth__fath_indicator,
    c(1L, 1L, 0L, NA, 1L, NA, NA, 1L)
  )
  expect_true(is.integer(out$mh_p_famhx__suic__moth__fath_indicator))
  expect_identical(out[names(df_suic)], df_suic)
})

# Score fixture: parents-overall score encodes the (father, mother)
# endorsement pair. Documented mapping, derived by hand:
#   (0, 0)   -> 0
#   (1, 0)   -> 1
#   (0, 1)   -> 2
#   (1, 1)   -> 3
#   (NA, 1)  -> 4
#   (1, NA)  -> 5
#   (NA, 0), (0, NA), (NA, NA) -> NA
# NA endorsements arise either from a ticked 999 box or from no ticked box at
# all; both paths are exercised below.
df_alc_score <- tibble::tibble(
  participant_id = sprintf("sub-%02d", 1:9),
  session_id = "ses-00A",
  # father: no, yes, no, yes, 999, yes, 999, no, 999
  mh_p_famhx__alc__fath_001___0 = c(1, 0, 1, 0, 0, 0, 0, 1, 0),
  mh_p_famhx__alc__fath_001___1 = c(0, 1, 0, 1, 0, 1, 0, 0, 0),
  mh_p_famhx__alc__fath_001___999 = c(0, 0, 0, 0, 1, 0, 1, 0, 1),
  # mother: no, no, yes, yes, yes, none-ticked, no, none-ticked, none-ticked
  mh_p_famhx__alc__moth_001___0 = c(1, 1, 0, 0, 0, 0, 1, 0, 0),
  mh_p_famhx__alc__moth_001___1 = c(0, 0, 1, 1, 1, 0, 0, 0, 0),
  mh_p_famhx__alc__moth_001___999 = c(0, 0, 0, 0, 0, 0, 0, 0, 0)
)

test_that("compute_mh_p_famhx__alc__moth__fath_score parents-overall coding", {
  out <- compute_mh_p_famhx__alc__moth__fath_score(df_alc_score)
  expect_equal(
    out$mh_p_famhx__alc__moth__fath_score,
    c(0L, 1L, 2L, 3L, 4L, 5L, NA, NA, NA)
  )
  expect_true(is.integer(out$mh_p_famhx__alc__moth__fath_score))
  expect_identical(out[names(df_alc_score)], df_alc_score)
})

test_that("compute_mh_p_famhx__drg__moth__fath_score parents-overall coding", {
  # (fath, moth) endorsements: (0,0) -> 0, (1,0) -> 1, (0,1) -> 2,
  # (NA via 999, 1) -> 4, (1, NA via nothing ticked) -> 5
  df_drg <- tibble::tibble(
    participant_id = sprintf("sub-%02d", 1:5),
    session_id = "ses-00A",
    mh_p_famhx__drg__fath_001___0 = c(1, 0, 1, 0, 0),
    mh_p_famhx__drg__fath_001___1 = c(0, 1, 0, 0, 1),
    mh_p_famhx__drg__fath_001___999 = c(0, 0, 0, 1, 0),
    mh_p_famhx__drg__moth_001___0 = c(1, 1, 0, 0, 0),
    mh_p_famhx__drg__moth_001___1 = c(0, 0, 1, 1, 0)
  )
  out <- compute_mh_p_famhx__drg__moth__fath_score(df_drg, combine = FALSE)
  expect_named(out, "mh_p_famhx__drg__moth__fath_score")
  expect_equal(
    out$mh_p_famhx__drg__moth__fath_score,
    c(0L, 1L, 2L, 4L, 5L)
  )
})

test_that("compute_mh_p_famhx_all computes every documented summary column", {
  famhx_domains <- c(
    "alc", "drg", "dep", "mania", "halluc",
    "troub", "nerve", "doc", "hosp", "suic"
  )
  checkbox_bases <- ABCDscores::famhx_config$input_vars
  plain_vars <- as.vector(outer(
    paste0("mh_p_famhx__", setdiff(famhx_domains, c("alc", "drg"))),
    c("__fath_001", "__moth_001"),
    paste0
  ))

  # Two-row fixture: row 1 endorses everything (option 1 ticked / plain 1),
  # row 2 denies everything (option 0 ticked / plain 0).
  df_all <- tibble::tibble(
    participant_id = c("sub-01", "sub-02"),
    session_id = "ses-00A"
  )
  for (base in checkbox_bases) {
    df_all[[paste0(base, "___1")]] <- c(1, 0)
    df_all[[paste0(base, "___0")]] <- c(0, 1)
  }
  for (var in plain_vars) {
    df_all[[var]] <- c(1, 0)
  }

  out <- compute_mh_p_famhx_all(df_all)

  ind_cols <- paste0("mh_p_famhx__", famhx_domains, "__moth__fath_indicator")
  score_cols <- paste0("mh_p_famhx__", famhx_domains, "__moth__fath_score")
  expect_true(all(c(ind_cols, score_cols) %in% names(out)))
  expect_true(all(ABCDscores::famhx_config$name %in% names(out)))
  # 20 either-parent/parents-overall scores plus one indicator per config row
  expect_equal(
    ncol(out),
    ncol(df_all) + length(c(ind_cols, score_cols)) +
      nrow(ABCDscores::famhx_config)
  )
  expect_equal(nrow(out), 2)

  # Row 1: both parents endorse every domain -> indicator 1, score 3 (yes/yes).
  # Row 2: both parents deny every domain    -> indicator 0, score 0 (no/no).
  expect_equal(unname(unlist(out[1, ind_cols])), rep(1L, 10))
  expect_equal(unname(unlist(out[2, ind_cols])), rep(0L, 10))
  expect_equal(unname(unlist(out[1, score_cols])), rep(3L, 10))
  expect_equal(unname(unlist(out[2, score_cols])), rep(0L, 10))

  # Spot-check per-relative indicators from the config-driven pass
  expect_equal(out$mh_p_famhx__alc__fath_indicator, c(1L, 0L))
  expect_equal(out$mh_p_famhx__drg__moth_indicator, c(1L, 0L))
})
