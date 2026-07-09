norm_tbl <- tibble::tibble(
  sex = "1",
  age_min = 18,
  age_max = 35,
  scale_r = 0:4,
  scale_t = 20:24
)

test_that("ss_tscore looks up the T-score by sex, age, and raw sum", {
  df <- tibble::tibble(
    var1 = c(0, 1, NA, 1, 2),
    var2 = c(1, 2, 1, 2, 5),
    age = c(18, 20, 25, 99, 35),
    sex = c("1", "1", "1", "1", "1")
  )
  out <- ss_tscore(
    df,
    data_norm = norm_tbl,
    max_na = 0,
    vars = c("var1", "var2")
  )
  # row 3: missing item over max_na; row 4: age out of range;
  # row 5: raw sum 7 outside the scale_r range
  expect_equal(out$tscore, c(21, 23, NA, NA, NA))
})

test_that("ss_tscore returns NA for a sex not present in the norm table", {
  df <- tibble::tibble(var1 = 1, var2 = 1, age = 20, sex = "2")
  out <- ss_tscore(df, data_norm = norm_tbl, vars = c("var1", "var2"))
  expect_equal(out$tscore, NA_integer_)
})

test_that("ss_tscore floors fractional ages before the range lookup", {
  df <- tibble::tibble(var1 = 1, var2 = 1, age = 35.9, sex = "1")
  out <- ss_tscore(df, data_norm = norm_tbl, vars = c("var1", "var2"))
  expect_equal(out$tscore, 22)
})

test_that("ss_tscore supports a custom score name and combine = FALSE", {
  df <- tibble::tibble(var1 = 1, var2 = 1, age = 20, sex = "1")
  out <- ss_tscore(
    df,
    data_norm = norm_tbl,
    vars = c("var1", "var2"),
    name = "t",
    combine = FALSE
  )
  expect_named(out, "t")
  expect_equal(out$t, 22)
})
