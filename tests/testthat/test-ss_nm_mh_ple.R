test_that("ss_nm_mh_ple counts endorsed forks without a valid response", {
  out <- ss_nm_mh_ple(
    df_ple,
    name = "nm",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    exclude = c("777")
  )
  # row 3: one endorsed fork unanswered; row 4: all three endorsed forks
  # yield no valid response ("777" is excluded); rows with unendorsed forks
  # owe no responses
  expect_equal(out$nm, c(0L, 0L, 1L, 3L, 0L))
  expect_type(out$nm, "integer")
})

test_that("ss_nm_mh_ple without exclude counts coded responses as valid", {
  out <- ss_nm_mh_ple(
    df_ple,
    name = "nm",
    fork_vars = fork_vars_ple,
    vars = vars_ple
  )
  # row 4: "777" now counts as a response, leaving two unanswered forks
  expect_equal(out$nm, c(0L, 0L, 1L, 2L, 0L))
})

test_that("ss_nm_mh_ple combine = FALSE returns only the score column", {
  out <- ss_nm_mh_ple(
    df_ple,
    name = "nm",
    fork_vars = fork_vars_ple,
    vars = vars_ple,
    exclude = c("777"),
    combine = FALSE
  )
  expect_named(out, "nm")
  expect_equal(nrow(out), nrow(df_ple))
})
