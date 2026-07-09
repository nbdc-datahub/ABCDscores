# Shared fixtures for the ss_* function tests.
#
# 777 ("Don't know") and 999 ("Decline to answer") are the ABCD non-response
# codes passed via the `exclude` argument throughout the suite.

df_codes <- tibble::tribble(
  ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
  "ses-00A",   1,  1,   1,   1,   NA,
  "ses-01A",   2,  777, 2,   2,   2,
  "ses-02A",   3,  3,   999, 3,   3,
  "ses-03A",   4,  4,   4,   777, NA,
  "ses-04A",   5,  NA,  777, 999, 5,
  "ses-05A",   NA, NA,  NA,  NA,  NA,
  "ses-06A",   1,  NA,  NA,  NA,  NA
)

vars_codes <- c("a", "b", "c", "d", "e")

# The same data with character and factor item columns. Summary scores must be
# identical across all three representations (regression for the v6.1.0 bug
# where factor codes were coerced to their level indices).
df_codes_chr <- df_codes
df_codes_chr[vars_codes] <- lapply(df_codes_chr[vars_codes], as.character)

df_codes_fct <- df_codes
df_codes_fct[vars_codes] <- lapply(
  df_codes_fct[vars_codes],
  function(x) factor(as.character(x))
)

# Factor frame whose level indices differ from the level labels in every
# column, so index-based coercion cannot produce accidentally correct results:
# level indices are a = (1, 3, 2), b = (1, 3, 2) while the labels are
# a = (10, 777, 20), b = (30, 999, 40).
df_fct_bug <- tibble::tibble(
  a = factor(c("10", "777", "20")),
  b = factor(c("30", "999", "40"))
)

# Numeric fixture with non-finite values: the ss_* utilities convert Inf,
# -Inf, and NaN in numeric columns to NA before summarization.
df_nonfinite <- tibble::tibble(
  a = c(2, Inf, -Inf, NaN),
  b = c(4, 6, 7, 8)
)

# Forked (branching-logic) fixture for the ss_*_mh_ple functions: v* items are
# administered only when the matching f* fork variable equals "1".
df_ple <- tibble::tribble(
  ~session_id, ~f1, ~f2, ~f3, ~v1,   ~v2, ~v3,
  "ses-00A",   "1", "1", "1", "2",   "3", "4",
  "ses-01A",   "1", "0", "1", "2",   "9", "4",
  "ses-02A",   "1", "1", "1", "2",   NA,  "4",
  "ses-03A",   "1", "1", "1", "777", NA,  NA,
  "ses-04A",   "0", "0", "0", NA,    NA,  NA
)

fork_vars_ple <- c("f1", "f2", "f3")
vars_ple <- c("v1", "v2", "v3")
