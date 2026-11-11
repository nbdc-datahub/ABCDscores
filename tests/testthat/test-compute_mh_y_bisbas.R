# Tests for compute_mh_y_bisbas__bis_sum(): mh_y_bisbas__bis_005 is reverse
# coded (0-3 -> 3-0) before the 7 BIS items are summed. Items are character,
# as in the ABCD release data.

df_bis <- tibble::as_tibble(
  stats::setNames(
    lapply(vars_mh_y_bisbas__bis, \(x) c("0", "1", "3", NA)),
    vars_mh_y_bisbas__bis
  )
)

test_that("compute_mh_y_bisbas__bis_sum reverse codes item 005", {
  # row 1: six 0s + reversed 0 = 3; row 2: six 1s + reversed 1 = 8;
  # row 3: six 3s + reversed 3 = 18; row 4: all missing
  out <- compute_mh_y_bisbas__bis_sum(df_bis, combine = FALSE)
  expect_equal(out$mh_y_bisbas__bis_sum, c(3, 8, 18, NA))
})

test_that("compute_mh_y_bisbas__bis_sum keeps the original items when combining", {
  out <- compute_mh_y_bisbas__bis_sum(df_bis)
  expect_equal(out$mh_y_bisbas__bis_005, df_bis$mh_y_bisbas__bis_005)
  expect_equal(out$mh_y_bisbas__bis_sum, c(3, 8, 18, NA))
})
