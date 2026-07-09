test_that("ss_sum computes row sums with exclude and max_na", {
  out <- ss_sum(
    df_codes,
    name = "sum",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999")
  )
  expect_equal(out$sum, c(4L, 8L, 12L, NA, NA, NA, NA))
  expect_type(out$sum, "integer")
})

test_that("ss_sum default max_na allows all but one missing item", {
  out <- ss_sum(
    df_codes,
    name = "sum",
    vars = vars_codes,
    exclude = c("777", "999")
  )
  expect_equal(out$sum, c(4L, 8L, 12L, 12L, 10L, NA, 1L))
})

test_that("ss_sum as_integer = FALSE returns doubles", {
  out <- ss_sum(
    df_codes,
    name = "sum",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    as_integer = FALSE
  )
  expect_type(out$sum, "double")
  expect_equal(out$sum, c(4, 8, 12, NA, NA, NA, NA))
})

test_that("ss_sum combine = FALSE returns only the score column", {
  out <- ss_sum(
    df_codes,
    name = "sum",
    vars = vars_codes,
    max_na = 1,
    combine = FALSE
  )
  expect_named(out, "sum")
  expect_equal(nrow(out), nrow(df_codes))
})

test_that("ss_sum events restricts scores to the selected sessions", {
  out <- ss_sum(
    df_codes,
    name = "sum",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    events = c("ses-00A", "ses-02A")
  )
  expect_equal(out$sum, c(4L, NA, 12L, NA, NA, NA, NA))
})

test_that("ss_sum is identical for numeric, character, and factor input", {
  args <- list(
    name = "sum", vars = vars_codes, max_na = 1,
    exclude = c("777", "999"), combine = FALSE
  )
  out_num <- do.call(ss_sum, c(list(df_codes), args))
  out_chr <- do.call(ss_sum, c(list(df_codes_chr), args))
  out_fct <- do.call(ss_sum, c(list(df_codes_fct), args))
  expect_identical(out_chr, out_num)
  expect_identical(out_fct, out_num)
})

test_that("ss_sum does not coerce factor codes to level indices (v6.1.0)", {
  out <- ss_sum(
    df_fct_bug,
    name = "s",
    vars = c("a", "b"),
    max_na = 0,
    exclude = c("777", "999")
  )
  expect_equal(out$s, c(40L, NA, 60L))
})

test_that("ss_sum treats non-finite values as missing", {
  out <- ss_sum(df_nonfinite, name = "s", vars = c("a", "b"), max_na = 1)
  expect_equal(out$s, c(6L, 6L, 7L, 8L))
  out0 <- ss_sum(df_nonfinite, name = "s", vars = c("a", "b"), max_na = 0)
  expect_equal(out0$s, c(6L, NA, NA, NA))
})

test_that("ss_sum treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(a = c("2", "Inf", "NaN"), b = c("4", "6", "8"))
  out <- ss_sum(df, name = "s", vars = c("a", "b"), max_na = 1)
  expect_equal(out$s, c(6L, 6L, 8L))
})
