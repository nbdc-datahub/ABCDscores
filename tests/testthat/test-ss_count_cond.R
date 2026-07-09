df_cc <- tibble::tibble(
  a = c(1, 2, NA, 777),
  b = c(2, 2, 2, 2)
)

conds_cc <- c("a >= 1", "b == 2")

test_that("ss_count_cond counts matched conditions within max_na", {
  out <- ss_count_cond(
    df_cc,
    name = "n",
    vars = c("a", "b"),
    cond = conds_cc,
    exclude = c("777"),
    max_na = 0
  )
  # rows 3-4 have one missing/excluded value, over the max_na = 0 limit
  expect_equal(out$n, c(2, 2, NA, NA))
})

test_that("ss_count_cond counts remaining conditions when within max_na", {
  out <- ss_count_cond(
    df_cc,
    name = "n",
    vars = c("a", "b"),
    cond = conds_cc,
    exclude = c("777"),
    max_na = 1
  )
  expect_equal(out$n, c(2, 2, 1, 1))
})

test_that("ss_count_cond combine = TRUE keeps the input columns", {
  out <- ss_count_cond(
    df_cc,
    name = "n",
    vars = c("a", "b"),
    cond = conds_cc,
    exclude = c("777"),
    max_na = 1,
    combine = TRUE
  )
  expect_identical(out[names(df_cc)], df_cc)
  expect_true("n" %in% names(out))
})

test_that("ss_count_cond does not coerce factor codes to level indices (v6.1.0)", {
  df_fct <- tibble::tibble(
    a = factor(c("2", "777")),
    b = factor(c("5", "5"))
  )
  out <- ss_count_cond(
    df_fct,
    name = "n",
    vars = c("a", "b"),
    cond = c("a == 2", "b == 5"),
    exclude = c("777"),
    max_na = 1
  )
  # with index coercion, a would become c(1, 2) and b c(1, 1), yielding c(1, 1)
  expect_equal(out$n, c(2, 1))
})

test_that("ss_count_cond treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(a = c("2", "Inf"))
  out <- ss_count_cond(df, name = "n", vars = "a", cond = "a >= 1", max_na = 1)
  expect_equal(out$n, c(1, 0))
})
