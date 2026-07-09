# Tests for the generic medication (rx) engines in R/scores_ph_meds.R:
# compute_ph_meds_catg_all() and compute_ph_meds_estuse_flags_all(), plus one
# thin-wrapper smoke test each for compute_ph_p_meds_catg_all() and
# compute_ph_p_meds_estuse_flags_all().
#
# The engines join against the shipped lookup ABCDscores::rx_map (hardcoded
# inside compute_ph_meds_catg_all), so the fixtures use real RxCUI codes whose
# category membership was verified by inspecting rx_map directly (not by
# running the compute functions):
#
#   rx "73"  -> rx_ingr "docosahexaenoate", rx_pingr "docosahexaenoic acid",
#               rx_mingr "borage oil / docosahexaenoate / eicosapentaenoate",
#               rx_bn "Algal-900", rx_estuse "23"
#   rx "94"  -> rx_estuse "35"
#   rx "103" -> rx_ingr "mercaptopurine"
#   "999999999" appears in none of the rx_map tables.

# Minimal single-mapping config: no col_add gating, primary source `rx1`
# with fallback to `rx2` (mirrors the shipped 1yr rows of rx_config).
rx_cfg_ingr <- tibble::tibble(
  catg = "ingr",
  table_name = "test_tbl",
  col_add = NA_character_,
  col_summary1 = "rx1",
  use_col_add1 = FALSE,
  col_summary2 = "rx2",
  use_col_add2 = FALSE,
  name = "med_ingr"
)

test_that("compute_ph_meds_catg_all maps RxCUI with summary1/summary2 rule", {
  df <- tibble::tribble(
    ~rx1,        ~rx2,
    "73",        NA, # primary source matched
    NA,          "103", # primary NA -> fallback to secondary
    "103",       "73", # primary wins even when secondary has data
    "999999999", "73", # primary has data but no rx_map match -> NA,
    # no fallback (fallback is only for NA summary1)
    NA,          NA # no medication reported -> NA
  )
  out <- compute_ph_meds_catg_all(df, rx_config = rx_cfg_ingr)
  # Hand-derived from rx_map$rx_ingr: "73" -> docosahexaenoate,
  # "103" -> mercaptopurine; unmatched code and all-NA rows stay NA.
  expect_equal(
    out$med_ingr,
    c("docosahexaenoate", "mercaptopurine", "mercaptopurine", NA, NA)
  )
  expect_type(out$med_ingr, "character")
})

test_that("compute_ph_meds_catg_all coerces non-character RxCUI columns", {
  # Numeric codes must behave like their character form (as.character(73)
  # is "73" -> rx_ingr "docosahexaenoate").
  df <- tibble::tibble(rx1 = c(73, NA), rx2 = c(NA, NA))
  out <- compute_ph_meds_catg_all(df, rx_config = rx_cfg_ingr)
  expect_equal(out$med_ingr, c("docosahexaenoate", NA))
})

test_that("compute_ph_meds_catg_all applies col_add gating per source flag", {
  # gated1 gates the primary source only; gated2 gates the fallback only.
  cfg <- tibble::tibble(
    catg = "ingr",
    table_name = "test_tbl",
    col_add = "gate",
    col_summary1 = "rx1",
    use_col_add1 = c(TRUE, FALSE),
    col_summary2 = "rx2",
    use_col_add2 = c(FALSE, TRUE),
    name = c("gated1", "gated2")
  )
  df <- tibble::tribble(
    ~rx1, ~rx2, ~gate,
    "73", NA,   "1", # gate passes
    "73", NA,   "0", # gate fails
    "73", NA,   NA, # gate missing counts as not "1"
    NA,   "73", "0", # fallback source, gate fails
    NA,   "73", "1" # fallback source, gate passes
  )
  out <- compute_ph_meds_catg_all(df, rx_config = cfg, combine = FALSE)
  # gated1: rows 1-3 use rx1 (gated: only gate == "1" kept); rows 4-5 use
  # rx2 with use_col_add2 = FALSE, so the gate is ignored.
  expect_equal(
    out$gated1,
    c("docosahexaenoate", NA, NA, "docosahexaenoate", "docosahexaenoate")
  )
  # gated2: rows 1-3 use rx1 ungated; rows 4-5 use rx2 gated.
  expect_equal(
    out$gated2,
    c(
      "docosahexaenoate", "docosahexaenoate", "docosahexaenoate",
      NA, "docosahexaenoate"
    )
  )
})

test_that("compute_ph_meds_catg_all treats NA use_col_add flags as FALSE", {
  # The shipped ph_y_meds rows carry use_col_add1/2 = NA; the engine
  # coalesces them to FALSE, so a failing gate must NOT drop the RxCUI.
  cfg <- rx_cfg_ingr
  cfg$col_add <- "gate"
  cfg$use_col_add1 <- NA
  cfg$use_col_add2 <- NA
  df <- tibble::tibble(rx1 = c("73", NA), rx2 = c(NA, "103"), gate = "0")
  out <- compute_ph_meds_catg_all(df, rx_config = cfg, combine = FALSE)
  expect_equal(out$med_ingr, c("docosahexaenoate", "mercaptopurine"))
})

test_that("compute_ph_meds_catg_all combine appends and preserves input", {
  df <- tibble::tibble(rx1 = c("73", NA), rx2 = c(NA, NA))
  out <- compute_ph_meds_catg_all(df, rx_config = rx_cfg_ingr)
  expect_named(out, c("rx1", "rx2", "med_ingr"))
  expect_identical(out[names(df)], df)

  out_only <- compute_ph_meds_catg_all(
    df,
    rx_config = rx_cfg_ingr,
    combine = FALSE
  )
  expect_named(out_only, "med_ingr")
  expect_equal(nrow(out_only), nrow(df))
})

test_that("compute_ph_meds_catg_all returns one column per config row", {
  cfg <- tibble::tibble(
    catg = c("ingr", "bn", "estuse"),
    table_name = "test_tbl",
    col_add = NA_character_,
    col_summary1 = "rx1",
    use_col_add1 = FALSE,
    col_summary2 = NA_character_,
    use_col_add2 = FALSE,
    name = c("med_ingr", "med_bn", "med_estuse")
  )
  df <- tibble::tibble(rx1 = c("73", NA))
  out <- compute_ph_meds_catg_all(df, rx_config = cfg, combine = FALSE)
  expect_named(out, c("med_ingr", "med_bn", "med_estuse"))
  # Hand-derived from rx_map for rx "73": ingr "docosahexaenoate",
  # bn "Algal-900", estuse "23".
  expect_equal(out$med_ingr, c("docosahexaenoate", NA))
  expect_equal(out$med_bn, c("Algal-900", NA))
  expect_equal(out$med_estuse, c("23", NA))
})

test_that("compute_ph_meds_catg_all validates data columns", {
  df <- tibble::tibble(rx1 = "73", rx2 = NA_character_)
  # Output name already present in the data.
  expect_error(
    compute_ph_meds_catg_all(
      dplyr::mutate(df, med_ingr = "x"),
      rx_config = rx_cfg_ingr
    )
  )
  # Required summary column missing from the data.
  expect_error(
    compute_ph_meds_catg_all(
      tibble::tibble(rx1 = "73"),
      rx_config = rx_cfg_ingr
    )
  )
})

# Estuse flags engine -------------------------------------------------------

# Config producing estuse category columns whose names follow the
# ph_p_meds__{otc,rx}__{time_point}_estuse__{slot} pattern that
# compute_ph_meds_estuse_flags_all() hardcodes internally. The extra "ingr"
# row must be ignored by the flag computation (it filters catg == "estuse").
rx_cfg_estuse <- tibble::tibble(
  catg = c("estuse", "estuse", "ingr"),
  table_name = "ph_p_meds",
  col_add = NA_character_,
  col_summary1 = c("otc1", "rx1", "otc1"),
  use_col_add1 = FALSE,
  col_summary2 = NA_character_,
  use_col_add2 = FALSE,
  name = c(
    "ph_p_meds__otc__1yr_estuse__001",
    "ph_p_meds__rx__1yr_estuse__001",
    "ph_p_meds__otc__1yr_ingr__001"
  )
)

flags_cfg <- tibble::tibble(
  time_point = "1yr",
  table_name = "ph_p_meds",
  idx = c("23", "35"),
  name = c("flag23", "flag35")
)

test_that("compute_ph_meds_estuse_flags_all flags matching estuse categories", {
  df <- tibble::tribble(
    ~otc1,        ~rx1,
    "73",         NA, # otc med in estuse category 23
    NA,           "94", # rx med in estuse category 35
    "73",         "94", # one med in each category
    "999999999",  NA, # unmatched RxCUI -> no category -> no flag
    NA,           NA # no medications reported
  )
  out <- compute_ph_meds_estuse_flags_all(
    df,
    rx_config_estuse_flags = flags_cfg,
    rx_config = rx_cfg_estuse,
    combine = FALSE
  )
  expect_named(out, c("flag23", "flag35"))
  # Hand-derived from rx_map$rx_estuse: "73" -> "23", "94" -> "35". Docs:
  # "1" when any estuse category matches idx, otherwise "0" (never NA:
  # missing categories are coalesced to "" before comparison).
  expect_equal(out$flag23, c("1", "0", "1", "0", "0"))
  expect_equal(out$flag35, c("0", "1", "1", "0", "0"))
  expect_type(out$flag23, "character")
  expect_type(out$flag35, "character")
  expect_true(all(unlist(out) %in% c("0", "1")))
})

test_that("compute_ph_meds_estuse_flags_all combine appends only the flags", {
  df <- tibble::tibble(otc1 = "73", rx1 = NA_character_)
  out <- compute_ph_meds_estuse_flags_all(
    df,
    rx_config_estuse_flags = flags_cfg,
    rx_config = rx_cfg_estuse
  )
  # Intermediate estuse category columns must not leak into the result.
  expect_named(out, c("otc1", "rx1", "flag23", "flag35"))
  expect_identical(out[names(df)], df)
  expect_equal(out$flag23, "1")
  expect_equal(out$flag35, "0")
})

# Thin-wrapper smoke tests ---------------------------------------------------

# One-row data frame carrying every input column the shipped ph_p_meds config
# requires (all NA), with the slot-001 OTC "verified" RxCUI set to "73".
new_ph_p_meds_data <- function(n = 1) {
  cfg <- ABCDscores::rx_config[
    ABCDscores::rx_config$table_name == "ph_p_meds",
  ]
  cols <- unique(stats::na.omit(as.character(
    c(cfg$col_add, cfg$col_summary1, cfg$col_summary2)
  )))
  tibble::as_tibble(
    stats::setNames(rep(list(rep(NA_character_, n)), length(cols)), cols)
  )
}

test_that("compute_ph_p_meds_catg_all wires the shipped ph_p_meds defaults", {
  cfg_p <- ABCDscores::rx_config[
    ABCDscores::rx_config$table_name == "ph_p_meds",
  ]
  df <- new_ph_p_meds_data()
  df$ph_p_meds__otc__id_001__v01 <- "73"
  out <- compute_ph_p_meds_catg_all(df, combine = FALSE)
  # The wrapper must compute exactly the ph_p_meds scores, in config order.
  expect_named(out, as.character(cfg_p$name))
  # Hand-derived: only the five 1yr OTC slot-001 scores are non-NA, because
  # rx "73" sits in col_summary1 of those rows and their use_col_add1 is
  # FALSE. The 2wk/24hr slot-001 rows select "73" too (as summary2/summary1)
  # but their use_col_add flag is TRUE and the gate column is NA, so the
  # RxCUI is dropped. All other slots have no data at all.
  expect_equal(out$ph_p_meds__otc__1yr_ingr__001, "docosahexaenoate")
  expect_equal(out$ph_p_meds__otc__1yr_pingr__001, "docosahexaenoic acid")
  expect_equal(
    out$ph_p_meds__otc__1yr_mingr__001,
    "borage oil / docosahexaenoate / eicosapentaenoate"
  )
  expect_equal(out$ph_p_meds__otc__1yr_bn__001, "Algal-900")
  expect_equal(out$ph_p_meds__otc__1yr_estuse__001, "23")
  non_na <- paste0(
    "ph_p_meds__otc__1yr_", c("ingr", "pingr", "mingr", "bn", "estuse"),
    "__001"
  )
  expect_true(all(is.na(unlist(out[setdiff(names(out), non_na)]))))
})

test_that("compute_ph_p_meds_estuse_flags_all wires the shipped defaults", {
  flags_p <- ABCDscores::rx_config_estuse_flags[
    ABCDscores::rx_config_estuse_flags$table_name == "ph_p_meds",
  ]
  df <- new_ph_p_meds_data(n = 2)
  df$ph_p_meds__otc__id_001__v01[1] <- "73"
  out <- compute_ph_p_meds_estuse_flags_all(df, combine = FALSE)
  # 95 estuse categories x 3 time points for ph_p_meds, in config order.
  expect_named(out, as.character(flags_p$name))
  # Hand-derived: rx "73" maps to estuse category "23" for the 1yr time
  # point only (2wk/24hr categories are gate-filtered to NA, see above), so
  # row 1 flags exactly ph_p_meds__1yr_estuse___23 and row 2 (no meds)
  # flags nothing.
  expect_equal(out$ph_p_meds__1yr_estuse___23, c("1", "0"))
  others <- setdiff(names(out), "ph_p_meds__1yr_estuse___23")
  expect_true(all(unlist(out[others]) == "0"))
})

# One-row data frame carrying every input column the shipped ph_y_meds config
# requires (all NA).
new_ph_y_meds_data <- function(n = 1) {
  cfg <- ABCDscores::rx_config[
    ABCDscores::rx_config$table_name == "ph_y_meds",
  ]
  cols <- unique(stats::na.omit(as.character(
    c(cfg$col_add, cfg$col_summary1, cfg$col_summary2)
  )))
  tibble::as_tibble(
    stats::setNames(rep(list(rep(NA_character_, n)), length(cols)), cols)
  )
}

test_that("compute_ph_y_meds_estuse_flags_all flags ph_y_meds categories", {
  flags_y <- ABCDscores::rx_config_estuse_flags[
    ABCDscores::rx_config_estuse_flags$table_name == "ph_y_meds",
  ]
  df <- new_ph_y_meds_data(n = 3)
  # row 1: OTC slot-001 medication "94" (rx_estuse "35"), 2wk gate unanswered
  # row 2: no medications
  # row 3: the same medication with the 2wk gate endorsed
  df$ph_y_meds__otc__id_001[c(1, 3)] <- "94"
  df$ph_y_meds__otc_001__01[3] <- "1"
  out <- compute_ph_y_meds_estuse_flags_all(df, combine = FALSE)
  expect_named(out, as.character(flags_y$name))
  # Hand-derived: the 1yr estuse category row for OTC slot 001 is ungated
  # (use_col_add1 is NA, coalesced to FALSE), so "94" maps to category "35"
  # in rows 1 and 3; the 2wk category row is gated by ph_y_meds__otc_001__01
  # and therefore only fires in row 3.
  expect_equal(out$ph_y_meds__1yr_estuse___35, c("1", "0", "1"))
  expect_equal(out$ph_y_meds__2wk_estuse___35, c("0", "0", "1"))
  others <- setdiff(
    names(out),
    c("ph_y_meds__1yr_estuse___35", "ph_y_meds__2wk_estuse___35")
  )
  expect_true(all(unlist(out[others]) == "0"))
})
