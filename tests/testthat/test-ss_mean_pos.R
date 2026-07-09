df_pos <- tibble::tribble(
  ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
  "ses-00A",   -1, 1,   1,   1,   NA,
  "ses-01A",   2,  777, 2,   2,   2,
  "ses-02A",   3,  3,   999, 3,   3,
  "ses-03A",   4,  4,   4,   777, NA,
  "ses-04A",   5,  NA,  777, 999, 5,
  "ses-05A",   NA, NA,  NA,  NA,  NA,
  "ses-06A",   1,  NA,  NA,  NA,  NA
)

test_that("ss_mean_pos averages only strictly positive values", {
  out <- ss_mean_pos(
    df_pos,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999")
  )
  # row 1: -1 is dropped from the numerator -> mean(1, 1, 1) = 1,
  # while max_na is still judged on the pre-positivity missingness (1 NA)
  expect_equal(out$mean, c(1, 2, 3, NA, NA, NA, NA))
})

test_that("ss_mean_pos drops zeros and returns NA when nothing is positive", {
  df <- tibble::tibble(a = c(0, 2, -1), b = c(2, 2, 0))
  out <- ss_mean_pos(df, name = "m", vars = c("a", "b"), max_na = 0)
  # row 3 has no NAs, but no positive values either -> NA, not NaN
  expect_equal(out$m, c(2, 2, NA))
})

test_that("ss_mean_pos combine = FALSE returns only the score column", {
  out <- ss_mean_pos(
    df_pos,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    combine = FALSE
  )
  expect_named(out, "mean")
  expect_equal(nrow(out), nrow(df_pos))
})

test_that("ss_mean_pos events restricts scores to the selected sessions", {
  out <- ss_mean_pos(
    df_pos,
    name = "mean",
    vars = vars_codes,
    max_na = 1,
    exclude = c("777", "999"),
    events = c("ses-00A", "ses-01A")
  )
  expect_equal(out$mean, c(1, 2, NA, NA, NA, NA, NA))
})

test_that("ss_mean_pos treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(a = c("Inf", "2"), b = c("4", "4"))
  out <- ss_mean_pos(df, name = "m", vars = c("a", "b"), max_na = 1)
  expect_equal(out$m, c(4, 3))
})
