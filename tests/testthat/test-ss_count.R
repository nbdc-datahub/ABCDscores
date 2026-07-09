df_cnt <- tibble::tibble(
  id  = as.character(1:8),
  a_1 = c(1, 1, NA, 1, 1, 1, 1, 1),
  a_2 = c(1, NA, NA, 1, 1, NA, 1, 1),
  b_1 = c(1, 1, NA, NA, 1, 1, 1, 1),
  b_2 = c(1, 1, NA, 1, 1, NA, 1, 1),
  c   = c(NA, 1, NA, 1, 777, 0, 1, 0)
)

vars_cnt <- c("a_1", "a_2", "b_1", "b_2", "c")

conds_cnt <- c(
  "a_1 == 1 & a_2 == 1",
  "b_1 == 1 & b_2 == 1",
  "c"
)

test_that("ss_count sums matched conditions and bare-field values", {
  out <- ss_count(df_cnt, name = "ss", vars = vars_cnt, cond = conds_cnt)
  # the all-NA row 3 is NA; row 5 adds the raw value 777 of bare field c
  expect_equal(out$ss, c(2L, 2L, NA, 2L, 779L, 0L, 3L, 2L))
  expect_type(out$ss, "integer")
})

test_that("ss_count exclude removes non-response codes before counting", {
  out <- ss_count(
    df_cnt,
    name = "ss",
    vars = vars_cnt,
    cond = conds_cnt,
    exclude = c("777")
  )
  expect_equal(out$ss, c(2L, 2L, NA, 2L, 2L, 0L, 3L, 2L))
})

test_that("ss_count allow_missingness = FALSE returns NA for any missing input", {
  out <- ss_count(
    df_cnt,
    name = "ss",
    vars = vars_cnt,
    cond = conds_cnt,
    exclude = c("777"),
    allow_missingness = FALSE
  )
  # only rows 7 and 8 are complete after exclusion
  expect_equal(out$ss, c(NA, NA, NA, NA, NA, NA, 3L, 2L))
})

test_that("ss_count combine = TRUE keeps the input columns unchanged", {
  out <- ss_count(
    df_cnt,
    name = "ss",
    vars = vars_cnt,
    cond = conds_cnt,
    combine = TRUE
  )
  expect_identical(out[names(df_cnt)], df_cnt)
  expect_true("ss" %in% names(out))
})

test_that("ss_count vars_temp columns are usable but not missingness-checked", {
  dat <- tibble::tibble(x = c(1, NA), t = c(5, 5))
  out <- ss_count(
    dat,
    name = "n",
    vars = "x",
    vars_temp = "t",
    cond = c("x == 1", "t == 5")
  )
  # row 2: x (the only checked var) is NA -> score is NA despite t == 5
  expect_equal(out$n, c(2L, NA))
})

test_that("ss_count treats character \"Inf\" as missing after coercion", {
  df <- tibble::tibble(x = c("1", "Inf"))
  out <- ss_count(df, name = "n", vars = "x", cond = "x == 1")
  # "Inf" coerces to numeric Inf, which is converted to NA; the row's only
  # input is then missing, so the score is NA
  expect_equal(out$n, c(1L, NA))
})
