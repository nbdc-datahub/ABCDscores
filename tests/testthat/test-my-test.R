# Sanity checks for the shared fixtures in helper-data.R.

test_that("fixture representations are aligned", {
  expect_identical(dim(df_codes_chr), dim(df_codes))
  expect_identical(dim(df_codes_fct), dim(df_codes))
})

test_that("factor fixtures can detect index-based coercion", {
  # as.numeric() on the raw factor yields level indices, not the coded values;
  # if this ever matched, the coercion regression tests would lose their power
  expect_false(identical(as.numeric(df_codes_fct$b), df_codes$b))
  expect_false(identical(as.numeric(df_fct_bug$a), c(10, 777, 20)))
})
