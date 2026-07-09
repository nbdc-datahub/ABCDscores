test_that("ss_mean_mh_ple averages only items behind an endorsed fork", {
  out <- ss_mean_mh_ple(
    df_ple,
    name = "mean",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    exclude = c("777")
  )
  # row 1: all forks endorsed -> mean(2, 3, 4) = 3
  # row 2: f2 not endorsed, so v2 = "9" is masked -> mean(2, 4) = 3
  # row 3: v2 missing behind an endorsed fork (1 real NA <= max_na) -> 3
  # row 4: only "777" answered -> no valid items -> NA
  # row 5: no fork endorsed -> NA
  expect_equal(out$mean, c(3, 3, 3, NA, NA))
})

test_that("ss_mean_mh_ple max_na = 0 rejects unanswered endorsed forks", {
  out <- ss_mean_mh_ple(
    df_ple,
    name = "mean",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 0,
    exclude = c("777")
  )
  expect_equal(out$mean, c(3, 3, NA, NA, NA))
})

test_that("ss_mean_mh_ple no_na = TRUE requires fully complete input", {
  out <- ss_mean_mh_ple(
    df_ple,
    name = "mean",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    exclude = c("777"),
    no_na = TRUE
  )
  # only row 1 has no missing or masked value anywhere
  expect_equal(out$mean, c(3, NA, NA, NA, NA))
})

test_that("ss_mean_mh_ple combine = FALSE returns only the score column", {
  out <- ss_mean_mh_ple(
    df_ple,
    name = "mean",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    max_na = 1,
    combine = FALSE
  )
  expect_named(out, "mean")
  expect_equal(nrow(out), nrow(df_ple))
})

test_that("ss_mean_mh_ple requires matching fork_vars and vars lengths", {
  expect_error(
    ss_mean_mh_ple(
      df_ple,
      name = "mean",
      fork_vars = c("f1", "f2"),
      vars = vars_ple
    )
  )
})
