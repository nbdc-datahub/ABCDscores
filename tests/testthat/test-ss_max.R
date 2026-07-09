df_max <- tibble::tribble(
  ~id,   ~session_id, ~A, ~B, ~C, ~D,
  "id1", "1",         1,  5,  2,  NA,
  "id1", "2",         2,  4,  NA, NA,
  "id1", "3",         3,  3,  3,  3,
  "id1", "4",         4,  2,  4,  2,
  "id1", "5",         5,  1,  5,  3
)

test_that("ss_max computes the row maximum ignoring NAs by default", {
  out <- ss_max(df_max, name = "max", vars = c("A", "B", "C", "D"))
  expect_equal(out$max, c(5, 4, 3, 4, 5))
})

test_that("ss_max applies exclude and max_na", {
  out <- ss_max(
    df_max,
    name = "max",
    vars = c("A", "B", "C", "D"),
    max_na = 1,
    exclude = c("1")
  )
  # rows 1-2 have two missing values after excluding "1"
  expect_equal(out$max, c(NA, NA, 3, 4, 5))
})

test_that("ss_max returns NA for rows exceeding max_na", {
  df <- tibble::tibble(a = c(1, NA), b = c(2, NA))
  out <- ss_max(df, name = "m", vars = c("a", "b"))
  expect_equal(out$m, c(2, NA))
})

test_that("ss_max events restricts scores to the selected sessions", {
  out <- ss_max(
    df_max,
    name = "max",
    vars = c("A", "B", "C", "D"),
    max_na = 1,
    exclude = c("1"),
    events = c("4")
  )
  expect_equal(out$max, c(NA, NA, NA, 4, NA))
})

test_that("ss_max combine = FALSE returns only the score column", {
  out <- ss_max(
    df_max,
    name = "max",
    vars = c("A", "B", "C", "D"),
    combine = FALSE
  )
  expect_named(out, "max")
  expect_equal(nrow(out), nrow(df_max))
})

test_that("ss_max does not coerce factor codes to level indices (v6.1.0)", {
  out <- ss_max(
    df_fct_bug,
    name = "m",
    vars = c("a", "b"),
    max_na = 0,
    exclude = c("777", "999")
  )
  expect_equal(out$m, c(30, NA, 40))
})

test_that("ss_max treats non-finite values as missing", {
  out <- ss_max(df_nonfinite, name = "m", vars = c("a", "b"), max_na = 1)
  # a maximum is never Inf: non-finite values are dropped as missing
  expect_equal(out$m, c(4, 6, 7, 8))
  out0 <- ss_max(df_nonfinite, name = "m", vars = c("a", "b"), max_na = 0)
  expect_equal(out0$m, c(4, NA, NA, NA))
})

test_that("ss_max treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(a = c("2", "Inf"), b = c("9", "6"))
  out <- ss_max(df, name = "m", vars = c("a", "b"), max_na = 1)
  expect_equal(out$m, c(9, 6))
})
