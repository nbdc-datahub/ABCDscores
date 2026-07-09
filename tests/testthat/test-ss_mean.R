test_that("ss_mean computes row means with exclude and max_na", {
  out <- ss_mean(
    df_codes,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999")
  )
  # rows 4-5 exceed max_na after exclusion, rows 6-7 by plain missingness
  expect_equal(out$mean, c(1, 2, 3, NA, NA, NA, NA))
})

test_that("ss_mean default max_na allows all but one missing item", {
  out <- ss_mean(
    df_codes,
    name = "mean",
    vars = vars_codes,
    exclude = c("777", "999")
  )
  # max_na defaults to length(vars) - 1, so only the all-NA row stays NA
  expect_equal(out$mean, c(1, 2, 3, 4, 5, NA, 1))
})

test_that("ss_mean returns NA above the max_na threshold", {
  df <- tibble::tibble(a = c(1, 1), b = c(2, NA), c = c(3, NA))
  out <- ss_mean(df, name = "m", vars = c("a", "b", "c"), max_na = 1)
  expect_equal(out$m, c(2, NA))
})

test_that("ss_mean combine = FALSE returns only the score column", {
  out <- ss_mean(
    df_codes,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    combine = FALSE
  )
  expect_named(out, "mean")
  expect_equal(nrow(out), nrow(df_codes))
})

test_that("ss_mean combine = TRUE keeps the input columns unchanged", {
  out <- ss_mean(df_codes, name = "mean", vars = vars_codes, max_na = 1)
  expect_identical(out[names(df_codes)], df_codes)
})

test_that("ss_mean events restricts scores to the selected sessions", {
  out <- ss_mean(
    df_codes,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    events = c("ses-00A", "ses-01A")
  )
  expect_equal(out$mean, c(1, 2, NA, NA, NA, NA, NA))
})

test_that("ss_mean is identical for numeric, character, and factor input", {
  args <- list(
    name = "mean", vars = vars_codes, max_na = 1,
    exclude = c("777", "999"), combine = FALSE
  )
  out_num <- do.call(ss_mean, c(list(df_codes), args))
  out_chr <- do.call(ss_mean, c(list(df_codes_chr), args))
  out_fct <- do.call(ss_mean, c(list(df_codes_fct), args))
  expect_identical(out_chr, out_num)
  expect_identical(out_fct, out_num)
})

test_that("ss_mean does not coerce factor codes to level indices (v6.1.0)", {
  out <- ss_mean(
    df_fct_bug,
    name = "m",
    vars = c("a", "b"),
    max_na = 0,
    exclude = c("777", "999")
  )
  expect_equal(out$m, c(20, NA, 30))
})

test_that("ss_mean validates its arguments", {
  expect_error(ss_mean(df_codes, name = c("m1", "m2"), vars = vars_codes))
  expect_error(ss_mean(df_codes, name = "m", vars = c("a", "not_a_column")))
})

test_that("ss_mean treats non-finite values as missing", {
  out <- ss_mean(df_nonfinite, name = "m", vars = c("a", "b"), max_na = 1)
  # Inf, -Inf, and NaN become NA: mean of the remaining item
  expect_equal(out$m, c(3, 6, 7, 8))
  out0 <- ss_mean(df_nonfinite, name = "m", vars = c("a", "b"), max_na = 0)
  # as missing values they count toward max_na
  expect_equal(out0$m, c(3, NA, NA, NA))
})

test_that("ss_mean treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(a = c("2", "Inf", "NaN"), b = c("4", "6", "8"))
  out <- ss_mean(df, name = "m", vars = c("a", "b"), max_na = 1)
  expect_equal(out$m, c(3, 6, 8))
})

test_that("ss_mean warns informatively about non-coercible strings", {
  df <- tibble::tibble(a = c("2", "abc"), b = c("4", "6"))
  expect_warning(
    out <- ss_mean(df, name = "m", vars = c("a", "b"), max_na = 1),
    "could not be coerced"
  )
  # the non-coercible value is treated as missing
  expect_equal(out$m, c(3, 6))
})
