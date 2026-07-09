df_pr <- tibble::tibble(
  session_id = paste0("ses-0", 0:4, "A"),
  a = c(2, 2, NA, 777, NA),
  b = c(3, NA, NA, 3, NA),
  c = c(4, 4, 4, 5, NA)
)

test_that("ss_prsum prorates the sum by the rounded mean of observed items", {
  out <- ss_prsum(
    df_pr,
    name = "prsum",
    vars = c("a", "b", "c"),
    max_na = 1,
    exclude = c("777")
  )
  # row 1: complete -> plain sum 9
  # row 2: sum 6, mean 3, 1 missing -> 6 + 3 * 1 = 9
  # row 3: 2 missing > max_na -> NA
  # row 4: "777" excluded; sum 8, mean 4, 1 missing -> 8 + 4 * 1 = 12
  # row 5: all missing -> NA
  expect_equal(out$prsum, c(9L, 9L, NA, 12L, NA))
  expect_type(out$prsum, "integer")
})

test_that("ss_prsum as_integer = FALSE returns doubles", {
  out <- ss_prsum(
    df_pr,
    name = "prsum",
    vars = c("a", "b", "c"),
    max_na = 1,
    exclude = c("777"),
    as_integer = FALSE
  )
  expect_type(out$prsum, "double")
  expect_equal(out$prsum, c(9, 9, NA, 12, NA))
})

test_that("ss_prsum rounds the imputed mean half to even", {
  df <- tibble::tibble(a = 3, b = 4, c = NA_real_)
  out <- ss_prsum(df, name = "s", vars = c("a", "b", "c"), max_na = 1)
  # mean 3.5 rounds to 4 (IEC 60559), so 7 + 4 * 1
  expect_equal(out$s, 11L)
})

test_that("ss_prsum combine = FALSE returns only the score column", {
  out <- ss_prsum(
    df_pr,
    name = "prsum",
    vars = c("a", "b", "c"),
    max_na = 1,
    combine = FALSE
  )
  expect_named(out, "prsum")
  expect_equal(nrow(out), nrow(df_pr))
})
