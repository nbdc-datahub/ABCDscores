test_that("ss_sum_mh_ple sums only items behind an endorsed fork", {
  out <- ss_sum_mh_ple(
    df_ple,
    name = "sum",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    exclude = c("777")
  )
  # row 1: 2 + 3 + 4; row 2: v2 masked (fork not endorsed) -> 2 + 4;
  # row 3: one real NA within max_na -> 2 + 4; rows 4-5: no valid items
  expect_equal(out$sum, c(9L, 6L, 6L, NA, NA))
  expect_type(out$sum, "integer")
})

test_that("ss_sum_mh_ple max_na = 0 rejects unanswered endorsed forks", {
  out <- ss_sum_mh_ple(
    df_ple,
    name = "sum",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 0,
    exclude = c("777")
  )
  expect_equal(out$sum, c(9L, 6L, NA, NA, NA))
})

test_that("ss_sum_mh_ple no_na = TRUE requires fully complete input", {
  out <- ss_sum_mh_ple(
    df_ple,
    name = "sum",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    exclude = c("777"),
    no_na = TRUE
  )
  expect_equal(out$sum, c(9L, NA, NA, NA, NA))
})

test_that("ss_sum_mh_ple combine = FALSE returns only the score column", {
  out <- ss_sum_mh_ple(
    df_ple,
    name = "sum",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    combine = FALSE
  )
  expect_named(out, "sum")
  expect_equal(nrow(out), nrow(df_ple))
})
