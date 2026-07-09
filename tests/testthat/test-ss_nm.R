test_that("ss_nm counts excluded codes as missing", {
  out <- ss_nm(
    df_codes,
    name = "nm",
    vars = vars_codes,
    exclude = c("777", "999")
  )
  expect_equal(out$nm, c(1L, 1L, 1L, 2L, 3L, 5L, 4L))
  expect_type(out$nm, "integer")
})

test_that("ss_nm without exclude counts only true NAs", {
  out <- ss_nm(df_codes, name = "nm", vars = vars_codes)
  expect_equal(out$nm, c(1L, 0L, 0L, 1L, 1L, 5L, 4L))
})

test_that("ss_nm combine = FALSE returns only the score column", {
  out <- ss_nm(
    df_codes,
    name = "nm",
    vars = vars_codes,
    exclude = c("777", "999"),
    combine = FALSE
  )
  expect_named(out, "nm")
  expect_equal(nrow(out), nrow(df_codes))
})

test_that("ss_nm events restricts scores to the selected sessions", {
  out <- ss_nm(
    df_codes,
    name = "nm",
    vars = vars_codes,
    exclude = c("777", "999"),
    events = c("ses-00A")
  )
  expect_equal(out$nm, c(1L, NA, NA, NA, NA, NA, NA))
})

test_that("ss_nm counts non-finite values as missing", {
  out <- ss_nm(df_nonfinite, name = "nm", vars = c("a", "b"))
  expect_equal(out$nm, c(0L, 1L, 1L, 1L))
})
