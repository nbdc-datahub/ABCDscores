# ss functions ------------------------------------------------------------

#' Compute mean
#'
#' @description
#' Computes the mean of a set of variables, with the option to exclude certain
#' values (for non-responses like "Don't know"/"Decline to answer") and to set
#' a maximum number of missing values.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param vars character vector. The names of the columns to be summarized.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: NULL; no restriction on missing values).
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param events character (vector). Only compute the summary score for the
#'   specified events (Default: NULL; computed for all events).
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: TRUE).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
#'   "ses-00A",   1,  1,   1,   1,   NA,
#'   "ses-01A",   2,  777, 2,   2,   2,
#'   "ses-02A",   3,  3,   999, 3,   3,
#'   "ses-02A",   4,  4,   4,   777, NA,
#'   "ses-03A",   5,  NA,  777, 999, 5,
#'   "ses-03A",   NA, NA,  NA,  NA,  NA,
#'   "ses-04A",   1,  NA,  NA,  NA,  NA
#' )
#'
#' data |>
#'   ss_mean(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
#'
#' data |>
#'   ss_mean(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999"),
#'     combine = FALSE
#'   )
#'
#' data |>
#'   ss_mean(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = NULL,
#'     exclude = NULL,
#'     events = c("ses-00A", "ses-01A"),
#'   )
ss_mean <- function(data,
                    name,
                    vars,
                    max_na = NULL,
                    exclude = NULL,
                    events = NULL,
                    combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  data_ss <- data |>
    select(
      all_of(vars)
    ) |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        ) |>
          as.character() |>
          as.numeric()
      ),
      "{name}" := if_else(
        rowSums(across(all_of(vars), is.na)) > max_na,
        NA,
        rowMeans(across(all_of(vars)), na.rm = TRUE)
      )
    ) |>
    check_assign_na(
      output = name,
      input = vars,
    ) |>
    select(
      -all_of(vars)
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

#' Compute sum
#'
#' @description
#' Computes the sum of a set of variables, with the option to exclude certain
#' values (for non-responses like "Don't know"/"Decline to answer") and to set
#' a maximum number of missing values.
#'
#' @inheritParams ss_mean
#' @param as_integer logical. Whether to coerce the summary score to an integer,
#'  default is `TRUE`. If `FALSE`, the summary score will be a double.
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
#'   "ses-00A",   1,  1,   1,   1,   NA,
#'   "ses-01A",   2,  777, 2,   2,   2,
#'   "ses-02A",   3,  3,   999, 3,   3,
#'   "ses-02A",   4,  4,   4,   777, NA,
#'   "ses-03A",   5,  NA,  777, 999, 5,
#'   "ses-03A",   NA, NA,  NA,  NA,  NA,
#'   "ses-04A",   1,  NA,  NA,  NA,  NA
#' )
#'
#' data |>
#'   ss_sum(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
#'
#' data |>
#'   ss_sum(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999"),
#'     combine = FALSE
#'   )
#'
#' data |>
#'   ss_sum(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = NULL,
#'     exclude = NULL,
#'     events = c("ses-00A", "ses-01A"),
#'   )
ss_sum <- function(data,
                   name,
                   vars,
                   max_na = NULL,
                   exclude = NULL,
                   events = NULL,
                   as_integer = TRUE,
                   combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(as_integer)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }
  output_type_func <- if (as_integer) as.integer else as.double

  data_ss <- data |>
    select(
      all_of(vars)
    ) |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        ) |>
          as.character() |>
          as.numeric()
      ),
      "{name}" := if_else(
        rowSums(across(all_of(vars), is.na)) > max_na,
        NA,
        rowSums(across(all_of(vars)), na.rm = TRUE)
      ) |>
        output_type_func()
    ) |>
    check_assign_na(
      output = name,
      input = vars,
    ) |>
    select(
      -all_of(vars)
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

#' Compute number missing
#'
#' @description
#' Computes the number of missing items among a set of variables, with the
#' option to exclude certain values (for non-responses like "Don't know" /
#' "Decline to answer"). If all items are NA, the summary score will not be
#' computed (assuming that the questionnaire was not filled out at all).
#'
#' @inheritParams ss_mean
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b,  ~c,  ~d,  ~e,
#'   "ses-00A",   1,  1,   1,   1,   NA,
#'   "ses-01A",   2,  777, 2,   2,   2,
#'   "ses-02A",   3,  3,   999, 3,   3,
#'   "ses-02A",   4,  4,   4,   777, NA,
#'   "ses-03A",   5,  NA,  777, 999, 5,
#'   "ses-03A",   NA, NA,  NA,  NA,  NA,
#'   "ses-04A",   1,  NA,  NA,  NA,  NA
#' )
#'
#' data |>
#'   ss_nm(
#'     name    = "nm",
#'     vars    = c("a", "b", "c", "d", "e"),
#'     exclude = c("777", "999")
#'   )
#'
#' data |>
#'   ss_nm(
#'     name    = "nm",
#'     vars    = c("a", "b", "c", "d", "e"),
#'     exclude = c("777", "999"),
#'     event   = c("ses-00A", "ses-01A")
#'   )
ss_nm <- function(data,
                  name,
                  vars,
                  exclude = NULL,
                  events = NULL,
                  combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  if (!is.null(exclude)) chk::chk_character(exclude)
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }

  data_ss <- data |>
    select(
      all_of(vars)
    ) |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        )
      ),
      "{name}" := rowSums(across(all_of(vars), is.na)) |>
        # coerce return type to integer
        as.integer()
    ) |>
    select(
      -all_of(vars)
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

#' Compute the number or count of matching conditions
#'
#' @description
#' Computes the number of conditions (provided as a character vector`cond`),
#' involving the input variables `vars`, that were found to be `TRUE`.
#' Options available to exclude certain values from the input variables
#' (provided as a character vector `exclude`).
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param vars character vector. The name(s) of the column(s) to be summarized.
#' @param vars_temp character vector. The name(s) of temporary column(s) used
#'   to compute the summary score. Note, these columns are not checked for
#'   missingness. See `allow_missingness`.
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: FALSE).
#' @param allow_missingness logical. Default set to TRUE. If TRUE, summary score
#'   is set to `NA` only when ALL the in-going fields have missingness.
#'   If FALSE, summary score is set to `NA` when ANY of the in-going fields
#'   have missingness. NOTE: `exclude` operation is performed prior to checking
#'   for missingness.
#' @param cond character vector. Each specified condition, involving the values
#'   of specific input fields, gets tested for `1` (`TRUE`) or `0` (`FALSE`).
#'   If a condition is specified as `"field_name"`, the numeric value
#'   in the field is counted and could be greater than 1. Whereas other
#'   conditions when met can get a value of `1` or `0`. The summary score
#'   is a sum over all the values obtained from testing each condition
#'   specified in `cond`.
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' dat <- tibble::tibble(
#'   id   = c("1", "2", "3", "4", "5", "6", "7", "8"),
#'   a_1  = c(1, 1, NA, 1, 1, 1, 1, 1),
#'   a_2  = c(1, NA, NA, 1, 1, NA, 1, 1),
#'   b_1  = c(1, 1, NA, NA, 1, 1, 1, 1),
#'   b_2  = c(1, 1, NA, 1, 1, NA, 1, 1),
#'   c    = c(NA, 1, NA, 1, 777, 0, 1, 0)
#' )
#'
#' # define conditions to assess
#' conditions <- c(
#'   "a_1 == 1 & a_2 == 1",
#'   "b_1 == 1 & b_2 == 1",
#'   "c"
#' )
#'
#' # count number of matched conditions
#' ss_count(
#'   data    = dat,
#'   name    = "ss",
#'   vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
#'   cond    = conditions,
#'   combine = TRUE
#' )
#'
#' ss_count(
#'   data    = dat,
#'   name    = "ss",
#'   vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
#'   cond    = conditions,
#'   exclude = c("777"),
#'   combine = TRUE
#' )
#'
#' conditions <- paste(
#'   c(
#'     "a_1 == 1 & a_2 == 1",
#'     "b_1 == 1 & b_2 == 1",
#'     "c >= 1"
#'   ),
#'   collapse = "&"
#' )
#'
#' ss_count(
#'   data    = dat,
#'   name    = "ss",
#'   vars    = c("a_1", "a_2", "b_1", "b_2", "c"),
#'   cond    = conditions,
#'   exclude = c("777"),
#'   combine = TRUE
#' )
#'
#' ss_count(
#'   data = dat,
#'   name = "ss",
#'   vars = c("a_1", "a_2", "b_1", "b_2", "c"),
#'   cond = conditions,
#'   exclude = c("777"),
#'   allow_missingness = FALSE,
#'   combine = TRUE
#' )
#'
ss_count <- function(data,
                     name,
                     vars,
                     vars_temp = NULL,
                     exclude = NULL,
                     combine = FALSE,
                     allow_missingness = TRUE,
                     cond) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  if (!is.null(vars_temp)) chk::chk_character(vars_temp)
  chk::check_names(data, c(vars, vars_temp))
  if (!is.null(exclude)) chk::chk_character(exclude)
  chk::chk_logical(combine)
  chk::chk_logical(allow_missingness)
  chk::chk_character(cond)

  data_ss <- data |>
    select(
      all_of(c(vars, vars_temp))
    ) |>
    mutate(
      across(
        all_of(c(vars, vars_temp)),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        )
      ),
      across(
        all_of(vars),
        ~ as.character(.x) |>
          as.numeric()
      )
    ) %>%
    mutate(
      !!name := rowSums(
        sapply(
          rlang::parse_exprs(cond),
          function(x) rlang::eval_tidy(x, .)
        ),
        na.rm = TRUE
      ) |>
        # coerce return type to integer
        as.integer()
    ) |>
    check_assign_na(
      output = name,
      input = vars,
      allow_missingness = allow_missingness
    ) |>
    select(
      !!name
    )

  if (combine) {
    bind_cols(data, data_ss)
  } else {
    data_ss
  }
}


#' Compute max across columns
#'
#' @description
#' Computes the max of a set of variables, with the option to exclude certain
#'  values (for non-responses like "Don't know"/"Decline to answer") and to set
#'  a maximum number of missing values.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param vars character vector. The names of the columns to be summarized.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: NULL; no restriction on missing values).
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param events character (vector). Only compute the summary score for the
#'   specified events (Default: NULL; computed for all events).
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: TRUE).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
#'
#' @examples
#'
#' data <- tibble::tribble(
#'   ~id,    ~session_id, ~A, ~B,  ~C, ~D,
#'   "id1",  "1",         1,  5,   2,  NA,
#'   "id1",  "2",         2,  4,   NA, NA,
#'   "id1",  "3",         3,  3,   3,  3,
#'   "id1",  "4",         4,  2,   4,  2,
#'   "id1",  "5",         5,  1,   5,  3
#' )
#'
#' ss_max(
#'   data,
#'   name = "summary",
#'   vars = c("A", "B", "C", "D")
#' )
#'
#' ss_max(
#'   data,
#'   name = "summary",
#'   vars = c("A", "B", "C", "D"),
#'   max_na = 1,
#'   exclude = c("1")
#' )
#'
#' ss_max(
#'   data,
#'   name = "summary",
#'   vars = c("A", "B", "C", "D"),
#'   max_na = 1,
#'   exclude = c("1"),
#'   events = c("4")
#' )
#'
ss_max <- function(data,
                   name,
                   vars,
                   max_na = NULL,
                   exclude = NULL,
                   events = NULL,
                   combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  data_ss <- data |>
    select(
      all_of(vars)
    ) |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        ) |>
          as.character() |>
          as.numeric()
      ),
      "{name}" := if_else(
        rowSums(across(all_of(vars), is.na)) > max_na,
        NA,
        purrr::invoke(
          pmax,
          across(vars),
          na.rm = TRUE
        )
      )
    ) |>
    select(
      -all_of(vars)
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}


#' Compute pro-rated sum
#'
#' @description
#' Computes the pro-rated sum of a set of variables, with the option to
#' exclude certain values (for non-responses like
#' "Don't know"/"Decline to answer") and to set a maximum number of
#' missing values. Also include a second field
#'
#' @inheritParams ss_sum
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tibble(
#'   participant_id = c("A", "A", "A", "B", "A", "B", "A"),
#'   session_id     = c("ses-00A", "ses-01A", "ses-02A", "ses-02A", "ses-03A", "0ses-3A", "ses-04A"),
#'   a              = c(1, 2, 3, 4, 5, NA, 1),
#'   b              = c(1, 777, 3, 4, NA, NA, NA),
#'   c              = c(1, 2, 999, 4, 777, NA, NA),
#'   d              = c(1, 2, 3, 777, 999, NA, NA),
#'   e              = c(NA, 2, 3, NA, 5, NA, NA)
#' )
#'
#' data |>
#'   ss_prsum(
#'     name = "score_prorated_sum",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
#'
#' data |>
#'   ss_prsum(
#'     name = "score_prorated_sum",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999"),
#'     combine = FALSE
#'   )
#'
#' data |>
#'   ss_prsum(
#'     name = "score_prorated_sum",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = NULL,
#'     exclude = NULL,
#'     events = c("ses-00A", "ses-01A"),
#'   )
ss_prsum <- function(data,
                     name,
                     vars,
                     max_na = NULL,
                     exclude = NULL,
                     events = NULL,
                     as_integer = TRUE,
                     combine = TRUE) {
  check_col_names(data, name)
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }
  if (!is.null(exclude)) chk::chk_character(exclude)
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  chk::chk_flag(combine)
  chk::chk_flag(as_integer)

  output_type_func <- if (as_integer) as.integer else as.double

  data_ss <- data |>
    ss_sum(
      name    = "tmp_sum",
      vars    = vars,
      max_na  = max_na,
      exclude = exclude,
      events  = events,
      combine = TRUE
    ) |>
    ss_mean(
      name    = "tmp_mean",
      vars    = vars,
      max_na  = max_na,
      exclude = exclude,
      events  = events,
      combine = TRUE
    ) |>
    ss_nm(
      name    = "tmp_nm",
      vars    = vars,
      exclude = exclude,
      events  = events,
      combine = TRUE
    ) |>
    mutate(
      tmp_value = round(tmp_mean),
      tmp_prsum = case_when(
        tmp_nm > 0 & tmp_nm <= max_na ~
          tmp_sum + (tmp_value * tmp_nm),
        .default = tmp_sum
      ) |>
        output_type_func()
    ) |>
    select(
      !!name := tmp_prsum
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute T-score
#' @description This function computes the T-score based on the given columns,
#' and the provided T-score table.
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param data_norm tbl. Data frame containing the T-score table. See details.
#' @param vars character vector. The names of the columns to be summarized.
#' @param name character. The column name of the T-score.
#' @param max_na numeric, positive whole number. Number of missing items
#'  allowed (Default: NULL; no restriction on missing values).
#' @param exclude character (vector). The value(s) to be excluded (Default:
#' NULL; all values are used).
#' @param col_age character. The name of the age column.
#' @param col_sex character The name of sex column.
#' @param combine logical. Whether to combine the summary score column with the
#'  input data frame (Default: TRUE).
#' @return tbl. The input data frame with the T-score appended as a new column
#' if `combine` is TRUE, otherwise only the T-score column.
#' @export
#' @autoglobal
#' @details
#' ### T-score table
#'
#' The `data_norm` should be a data frame containing the T-score table. The
#' default value `NULL` is only used for internal usage (see below). For normal
#' usage, the `data_norm` should be provided.
#'
#' The table should have the following columns:
#' - `sex`: character or factor both ok. The biological sex of the participant.
#' The values should be either "1" (male) or "2" (female).
#' - `age_min`: numeric. The minimum age of the participant.
#' - `age_max`: numeric. The maximum age of the participant.
#' - `scale_r`: numeric. The raw score of the scale.
#' - `scale_t`: numeric. The T-score of the scale.
#'
#' For example
#'
#' A tibble: n x 5
#' |sex     |age_min |age_max |scale_r |scale_t |
#' |:-------|:-------|:-------|:-------|:-------|
#' |`<chr>` |`<dbl>` |`<dbl>` |`<dbl>` |`<dbl>` |
#' |1       |18      |35      |50      |1       |
#' |1       |18      |35      |50.5    |2       |
#' |1       |18      |35      |51      |3       |
#' |1       |18      |35      |51.5    |4       |
#' ...
#'
#' ### out-range values
#' - If the age of the participant is out of the range of the T-score table,
#'  the function will return `NA`.
#' - If the raw score is out of the range of the T-score table, the function
#' will return `NA`.
#' - If any of the  `sex` column is not "1" or "2",
#' the function will return `NA`.
#' - If any of the required columns has `NA`, that row will return `NA`.
#'
#' ### Internal usage
#' When used in DSM internally, the `data_norm` can be omitted. Instead, the
#' function will try to find the T-score table from the `list_tscore` option,
#' and tries to find the tscore list based on object name provided in the
#' `list_tscore` option. Once the object is found, the function will automatically
#' extract the T-score table based on the function name.
#'
#' - The `list_tscore` object should present in the global environment.
#' - See [get_tscore_tbl()] for more details on how to construct
#'   the `list_tscore`.
#'
#' For example
#' ```r
#' my_tscore <<- readRDS("aseba_tscore.rds")
#' options(list_tscore = "my_tscore")
#' compute_mh_x_yyyy_zz_tscore(data)
#' ```
#'
#' @examples
#' data_norm <- tibble::tibble(
#'   sex = c("1", "1", "1", "1", "1"),
#'   age_min = 18,
#'   age_max = 35,
#'   scale_r = 0:4,
#'   scale_t = 20:24
#' )
#' data <- tibble::tibble(
#'   var1 = c(0, 1, NA, 1, 2),
#'   var2 = c(1, 2, 1, 2, 5),
#'   age = c(18, 20, 25, 99, 35),
#'   sex = c("1", "1", "1", "1", "1")
#' )
#' ss_tscore(
#'   data = data,
#'   data_norm = data_norm,
#'   max_na = 0,
#'   vars = c("var1", "var2")
#' )
ss_tscore <- function(
    data,
    data_norm = NULL,
    vars,
    name = "tscore",
    max_na = NULL,
    exclude = NULL,
    col_age = "age",
    col_sex = "sex",
    combine = TRUE) {
  chk::chk_data(data)
  chk::check_names(data, c(col_age, col_sex))
  chk::chk_logical(combine)
  check_col_names(data, name)
  chk::chk_string(col_age)
  chk::chk_string(col_sex)

  # internal use only, does not affect public users
  data_norm <- find_data_norm(data_norm)

  chk::chk_data(data_norm)
  chk::check_names(
    data_norm,
    c("sex", "age_min", "age_max", "scale_r", "scale_t")
  )
  name_col_sum <- sample(letters, 8, replace = TRUE) |>
    paste0(collapse = "")
  data_ss <- ss_sum(
    data,
    name    = name_col_sum,
    combine = TRUE,
    max_na  = max_na,
    exclude = exclude,
    vars    = vars
  ) |>
    select(
      all_of(c(col_sex, col_age, name_col_sum))
    ) |>
    mutate(
      across(
        all_of(c(col_sex)),
        as.character
      ),
      across(
        all_of(c(col_age)),
        ~ floor(as.numeric(as.character(.x)))
      )
    ) |>
    left_join(
      data_norm,
      relationship = "many-to-one",
      by = join_by(
        !!col_sex == sex,
        !!col_age >= age_min,
        !!col_age <= age_max,
        !!name_col_sum == scale_r
      )
    ) |>
    select(scale_t) |>
    rename(
      "{name}" := scale_t
    )

  if (combine) {
    data_ss <- bind_cols(data, data_ss)
  }

  data_ss
}

#' Compute the number or count of matching conditions
#'
#' @description
#' Computes the number of conditions (provided as a character vector`cond`),
#' involving the input variables `vars`, that were found to be `TRUE`.
#' Options available to exclude certain values from the input variables
#' (provided as a character vector `exclude`).
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param vars character vector. The names of the columns to be summarized.
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: FALSE).
#' @param cond character vector. Each specified condition, involving the values
#'   of specific input fields, gets tested for `1` (`TRUE`) or `0` (`FALSE`).
#'   If a condition is specified as `"field_name"`, the numeric value
#'   in the field is counted and could be greater than 1. Whereas other
#'   conditions when met can get a value of `1` or `0`. The summary score
#'   is a sum over all the values obtained from testing each condition
#'   specified in `cond`.
#' @param max_na numeric, positive whole number. Number of
#' missing items allowed.
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#'
#' @export
#' @autoglobal
#'
ss_count_cond <- function(data,
                          name,
                          vars,
                          exclude = NULL,
                          combine = FALSE,
                          cond,
                          max_na) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  if (!is.null(exclude)) chk::chk_character(exclude)
  chk::chk_logical(combine)
  chk::chk_character(cond)

  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  data_ss <- data |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        ) |>
          as.character() |>
          as.numeric()
      )
    ) |>
    rowwise() |>
    mutate(
      !!name := if_else(
        rowSums(across(all_of(vars), is.na)) > max_na,
        NA,
        sum(
          !!!rlang::parse_exprs(cond),
          na.rm = TRUE
        )
      )
    ) |>
    ungroup() |>
    select(
      !!name
    )

  if (combine) {
    cbind(data, data_ss)
  } else {
    data_ss
  }
}

#' Compute mean of positive values
#'
#' @description
#' Computes the mean of strictly positive values for a set of variables, with
#' the option to exclude certain values (for non-responses like
#' "Don't know"/"Decline to answer") and to set a maximum number of
#' missing values.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param name character. The name of the summary score.
#' @param vars character vector. The names of the columns to be summarized.
#' @param max_na numeric, positive whole number. Number of missing items
#'   allowed (Default: NULL; no restriction on missing values).
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param events character (vector). Only compute the summary score for the
#'   specified events (Default: NULL; computed for all events).
#' @param combine logical. Whether to combine the summary score column with the
#'   input data frame (Default: TRUE).
#'
#' @return tbl. The input data frame with the summary score appended as a new
#'   column.
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~session_id, ~a, ~b, ~c, ~d, ~e,
#'   "ses-00A", -1, 1, 1, 1, NA,
#'   "ses-01A", 2, 777, 2, 2, 2,
#'   "ses-02A", 3, 3, 999, 3, 3,
#'   "ses-02A", 4, 4, 4, 777, NA,
#'   "ses-03A", 5, NA, 777, 999, 5,
#'   "ses-03A", NA, NA, NA, NA, NA,
#'   "ses-04A", 1, NA, NA, NA, NA
#' )
#'
#' data |>
#'   ss_mean_pos(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999")
#'   )
#'
#' data |>
#'   ss_mean_pos(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = 1,
#'     exclude = c("777", "999"),
#'     combine = FALSE
#'   )
#'
#' data |>
#'   ss_mean_pos(
#'     name = "mean",
#'     vars = c("a", "b", "c", "d", "e"),
#'     max_na = NULL,
#'     exclude = NULL,
#'     events = c("ses-00A", "ses-01A"),
#'   )
ss_mean_pos <- function(data,
                        name,
                        vars,
                        max_na = NULL,
                        exclude = NULL,
                        events = NULL,
                        combine = TRUE) {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::chk_character(vars)
  chk::check_names(data, vars)
  chk::chk_flag(combine)
  if (!is.null(exclude)) {
    chk::chk_character(exclude)
  }
  if (!is.null(events)) {
    chk::chk_character(events)
    chk::check_names(data, "session_id")
  }
  if (!is.null(max_na)) {
    chk::chk_whole_number(max_na)
    chk::chk_gte(max_na, 0)
  } else {
    max_na <- length(vars) - 1
  }

  data_ss <- data |>
    select(
      all_of(vars)
    ) |>
    mutate(
      across(
        all_of(vars),
        ~ if_else(
          .x %in% exclude,
          NA,
          .x
        ) |>
          as.character() |>
          as.numeric()
      ),
      across(
        all_of(vars),
        ~ if_else(
          .x <= 0,
          NA,
          .x
        ),
        .names = "{col}_pos"
      ),
      "{name}" := if_else(
        rowSums(across(all_of(vars), is.na)) > max_na,
        NA,
        rowMeans(across(all_of(paste0(vars, "_pos"))), na.rm = TRUE)
      )
    ) |>
    check_assign_na(
      output = name,
      input = paste0(vars, "_pos")
    ) |>
    select(
      -all_of(c(vars, paste0(vars, "_pos")))
    )

  if (!is.null(events)) {
    data_ss <- select_events(data, data_ss, name, events)
  }

  if (combine) {
    bind_cols(
      data,
      data_ss
    )
  } else {
    data_ss
  }
}

# helper functions --------------------------------------------------------

# helper function: compute summary scores only for specific events
select_events <- function(data, data_ss, name, events) {
  bind_cols(
    select(data, session_id),
    data_ss
  ) |>
    mutate(
      "{name}" := if_else(
        session_id %in% events,
        .data[[name]],
        NA
      )
    ) |>
    select(
      -session_id
    )
}

#' Recode levels
#'
#' @description
#' Recodes specified levels of a character/factor variable, e.g., to apply
#' reverse coding before summary score computation.
#'
#' @param data tbl. Data frame containing the columns to be recoded.
#' @param vars character (vector). The name(s) of the column(s) to be recoded.
#' @param recode named character vector. The levels to be recoded, with the name
#'   being the original value and the value being the value to recode to.
#' @param temp logical. If `TRUE` creates a new column to save the recoded
#'   values. The new columns will be named as `temp_{vars}`.
#'
#' @return tbl. The input data frame with the recoded variable(s).
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tibble(
#'   var_a = c("1", "2", "3", "4", "5", NA, "999", "777"),
#'   var_b = c("5", "4", "3", "2", "1", "777", NA, "999")
#' )
#'
#' # recode individual variables
#' data |>
#'   recode_levels(
#'     vars = "var_a",
#'     recode = c("999" = "0", "777" = "0")
#'   ) |>
#'   recode_levels(
#'     vars = "var_b",
#'     recode = c("999" = "6", "777" = "7")
#'   )
#'
#' # apply the same recoding to several variables
#' data |>
#'   recode_levels(
#'     vars = c(
#'       "var_a",
#'       "var_b"
#'     ),
#'     recode = c(
#'       "1" = "5",
#'       "2" = "4",
#'       "4" = "2",
#'       "5" = "1"
#'     )
#'   )
recode_levels <- function(data, vars, recode, temp = FALSE) {
  chk::chk_data(data)
  chk::chk_character(vars)
  chk::chk_character(recode)
  chk::chk_named(recode)
  chk::chk_logical(temp)
  if (temp) {
    vars <- glue::glue("temp_{vars}")
  }
  chk::check_names(data, vars)

  for (i in 1:length(vars)) {
    name <- vars[i]
    conditions <- c(
      glue::glue('{name} == "{names(recode)}" ~ "{recode}"'),
      glue::glue("TRUE ~ {name}")
    ) |>
      rlang::parse_exprs()

    data <- data |>
      mutate(
        "{name}" := case_when(!!!conditions)
      )
  }

  data
}

#' Combine columns
#'
#' @description
#' Combines two columns into one. The name of the first column is used for the
#' new column, the second  column is removed. Used for cases where different
#' versions of the same variable exist that have to be combined before computing
#' a summary score.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param col_1 character. The name of the first variable/column.
#' @param col_2 character. The name of the second variable/column.
#' @param name character. The name of the field with the combined data.
#'    By default, `name = NULL`, the combined data field is named the same
#'    as `col_1`.
#' @param keep_other logical. Whether to combine the combined column with the
#'    input data frame (Default: TRUE).
#' @return tbl. The input data frame with the combined column and the second
#'   column removed. The name of the combined column is the same as `col_1`,
#'   or user-specified in the `name` argument.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tibble(
#'   var_id = c("A", "B", "C"),
#'   var_orig = c(1, NA, 3),
#'   var_alt = c(NA, 2, 4)
#' )
#'
#' data |>
#'   combine_cols(
#'     col_1 = "var_orig",
#'     col_2 = "var_alt"
#'   )
#'
#' data |>
#'   combine_cols(
#'     "var_orig",
#'     "var_alt",
#'     name = "out"
#'   )
#'
#' data |>
#'   combine_cols(
#'     "var_orig",
#'     "var_alt",
#'     name = "out",
#'     keep_other = FALSE
#'   )
#'
combine_cols <- function(data,
                         col_1,
                         col_2,
                         name = NULL,
                         keep_other = TRUE) {
  chk::chk_data(data)
  chk::chk_character(col_1)
  chk::chk_scalar(col_1)
  chk::chk_character(col_2)
  chk::chk_scalar(col_2)
  chk::check_names(data, c(col_1, col_2))
  if (!is.null(name)) {
    chk::chk_character(name)
    chk::chk_scalar(name)
    check_col_names(data, name)
  }

  data_ss <- data |>
    mutate(
      !!col_1 := if_else(
        is.na(.data[[col_1]]),
        .data[[col_2]],
        .data[[col_1]]
      )
    ) |>
    select(
      -all_of(col_2)
    )

  if (!is.null(name)) {
    data_ss <- data_ss |>
      rename(
        !!name := !!col_1
      )
  }

  if (!keep_other) {
    data_ss <- data_ss |>
      select(
        any_of(
          c(col_1, name)
        )
      )
  }

  data_ss
}

#' Combine levels from two variables to create a new variable
#'
#' @description
#' Combines levels from two columns into new level stored into a new column.
#' Allows users to create new classifications using levels defined in existing
#' fields.
#'
#' @param data tbl. Data frame containing the two columns to be summarized.
#' @param vars named list of length 1. The name of the list component will be
#'    used as the name for the newly created variable/column, and the character
#'    elements specifies the two existing fields from which the levels will be
#'    combined.
#' @param conds named list. The name of the each of the list element will be
#'    used as the label for the new level created, and the two character
#'    vectors represent the levels in the first and second variables,
#'    respectively, that will be combined to create the new level.
#' @param default character (or `NA`). One of the two input variables specified
#'    in `vars` that will be used to set the levels of the new column after
#'    all the combinations in `conds` are exhausted. If `default = NA`, the
#'    remaining conditions `conds` have been exhausted will be set to `NA`.
#' @param combine logical. Whether to combine the summary score column with the
#'    input data frame (Default: TRUE).
#'
#' @return tbl. The input data frame with the new column with combined
#'    levels appended at the end.
#'
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tibble(
#'   var_1 = c("a", "b", "b", "c"),
#'   var_2 = c(1, NA, 2, 3)
#' )
#'
#' data |>
#'   combine_levels(
#'     vars = list(
#'       "var_3" = c("var_1", "var_2")
#'     ),
#'     conds = list(
#'       "a1" = list("a", 1),
#'       "b0" = list("b", NA),
#'       "b2" = list("b", 2)
#'     ),
#'     default = "var_1",
#'     combine = TRUE
#'   )
combine_levels <- function(data,
                           vars,
                           conds,
                           default = NA,
                           combine = TRUE) {
  chk::chk_data(data)
  chk::chk_list(vars)
  chk::chk_named(vars)
  chk::chk_scalar(vars)
  chk::chk_list(conds)
  chk::chk_named(conds)
  chk::chk_gte(length(conds), 1)
  chk::check_names(data, unlist(vars))

  old_fields <- vars[[1]]
  new_field <- names(vars)[1]

  conditions <- c(
    purrr::map_chr(
      1:length(conds),
      ~ glue::glue(
        ".data[[old_fields[1]]] %in% conds[[{.x}]][[1]] & ",
        ".data[[old_fields[2]]] %in% conds[[{.x}]][[2]] ~ ",
        "names(conds)[{.x}]"
      )
    ),
    if_else(
      is.na(default),
      glue::glue("TRUE ~ NA"),
      glue::glue("TRUE ~ {default}")
    )
  ) |>
    rlang::parse_exprs()

  # data <- data |>
  data_ss <- data |>
    transmute(
      !!new_field := case_when(!!!conditions)
    )

  if (!combine) {
    data_ss
  } else {
    bind_cols(data, data_ss)
  }
}

#' Check an output field and assign NA when input variables all have NAs
#'
#' @description
#' Checks the specified output column in a data frame and assigns NA to its
#' value depending on the missingness of a set of input columns.
#' If `allow_missingness = TRUE`, the output column is set to NA only when *all*
#' the specified input columns are NA.
#' If `allow_missingness = FALSE`, the output column is set to NA when *any* of
#' the input columns are NA.
#' This function is useful for propagating missingness from input variables
#' to a derived output.
#'
#' @param data tbl. Data frame containing the columns to be summarized.
#' @param output character of length 1. The name of the first variable/column.
#' @param input character. The name of the second variable/column.
#' @param allow_missingness logical. Default set to TRUE. If TRUE, `output`
#'   field is set to `NA` only when ALL the fields in `input` have missingness.
#'   If FALSE, `output` is set to `NA` when ANY of the `input` fields
#'   have missingness.
#' @return tbl. The input data frame with the `output` column modified.
#' @export
#' @autoglobal
#'
#' @examples
#' # Example data
#' dat <- tibble::tibble(
#'   a = c(1, NA, 3),
#'   b = c(NA, NA, 2),
#'   c = c(1, 2, 3),
#'   out = c(10, 11, 12)
#' )
#'
#' # Assign NA to out when all of a and b are NA
#' check_assign_na(
#'   dat,
#'   output = "out", input = c("a", "b"), allow_missingness = TRUE
#' )
#'
#' # Assign NA to out when any of a and b are NA
#' check_assign_na(
#'   dat,
#'   output = "out", input = c("a", "b"), allow_missingness = FALSE
#' )
#'
check_assign_na <- function(data, output, input, allow_missingness = TRUE) {
  chk::chk_data(data)
  chk::chk_character(output)
  chk::chk_scalar(output)
  chk::chk_character(input)

  input <- glue::glue("^{input}$") |>
    paste(collapse = "|")

  if (allow_missingness) {
    data |>
      mutate(
        !!output := if_else(
          if_all(
            matches(input),
            ~ is.na(.x)
          ),
          NA,
          .data[[output]]
        )
      )
  } else {
    data |>
      mutate(
        !!output := if_else(
          if_any(
            matches(input),
            ~ is.na(.x)
          ),
          NA,
          .data[[output]]
        )
      )
  }
}

#' Creates a new column by converting session_id column into a numeric
#'
#' @description
#' Creates a new column which contains the parsed numeric value for the
#' visit. Annual visits are set to integers, where 0 = baseline, 1 = year 1,
#' and so on. Mid-years are defined as 0.5 increments of the
#' prior annual visits, e.g., 0.5 = between baseline and year 1,
#' 1.5 = between year 1 and 2, and so on.
#'
#' @param data tbl. Data frame containing the `session_id` column.
#' @param name character of length 1. The name of the newly created and appended
#' column. Default: `session_num`
#'
#' @return tbl. The input data frame with the `name` column added.
#' @export
#' @autoglobal
#'
#' @examples
#' # Example data
#' dat <- tibble::tibble(
#'   participant_id = c("A123", "A123", "A123", "A123"),
#'   session_id = c("ses-00S", "ses-00A", "ses-00M", "ses-01A"),
#'   a = c(1, 2, 3, 4),
#'   b = c(10, 11, 12, NA)
#' )
#'
#' # Create a new column (default: `session_num`) with numeric session
#' create_session_num(
#'   dat
#' )
#'
#' # Create a new column called `num` that contains the session numbers
#' create_session_num(
#'   dat,
#'   name = "num"
#' )
#'
create_session_num <- function(data, name = "session_num") {
  chk::chk_data(data)
  chk::chk_character(name)
  chk::chk_scalar(name)
  chk::check_names(data, "session_id")

  key <- data.frame(
    session_id = unique(data$session_id)
  ) |>
    mutate(
      num = stringr::str_remove(
        session_id,
        "ses-"
      ),
      num = case_when(
        stringr::str_detect(num, stringr::fixed("S")) ~ NA,
        stringr::str_detect(num, stringr::fixed("A")) ~ readr::parse_number(num),
        .default = readr::parse_number(num) + 0.5
      )
    ) |>
    select(
      session_id,
      num
    )

  data |>
    left_join(
      key,
      join_by(session_id)
    ) |>
    relocate(
      num,
      .after = session_id
    ) |>
    rename(
      !!name := num
    )
}

#' Compute time interval between two dates
#'
#' @description
#' Calculate the time difference between two dates in specified units
#' (years, months, or days). Uses lubridate intervals for accurate calculations
#' across calendar irregularities.
#'
#' @param date_start Starting date. Must be a date or datetime object
#' compatible with lubridate.
#' @param date_end Ending date. Must be a date or datetime object
#' compatible with lubridate.
#' @param unit Character string specifying the unit for the result.
#' Must be one of "years", "months", or "days". Defaults to "years".
#'
#' @return A numeric value representing the time difference in the specified unit.
#'
#' @examples
#' # Calculate age in years
#' compute_age(as.Date("1990-01-01"), as.Date("2024-01-01"))
#'
#' # Calculate age in months
#' compute_age(as.Date("2023-01-01"), as.Date("2024-01-01"), unit = "months")
#'
#' # Calculate age in days
#' compute_age(as.Date("2023-12-01"), as.Date("2024-01-01"), unit = "days")
#'
#' @importFrom lubridate interval years days
#'
#' @export
#' @autoglobal
compute_age <- function(date_start,
                        date_end,
                        unit = c("years", "months", "days")) {
  unit <- match.arg(unit)

  date_interval <- lubridate::interval(date_start, date_end)

  if (unit == "years") {
    date_interval / lubridate::years(1)
  } else if (unit == "months") {
    date_interval / months(1)
  } else if (unit == "days") {
    date_interval / lubridate::days(1)
  }
}

#' Create static variable, one per participant, using longitudinal responses
#'
#' Update an existing field to include longitudinal responses.
#' Use data for each `id` from the first available `event` and
#' set that value for all `event` rows.
#'
#' @param data Dataframe with fields specified in `id`, `event`, and `var`.
#' @param id character of length 1. Name of field that contains the IDs for
#' which we need to assess the longitudinal data.
#' @param event character of length 1. Name of field that contains the
#' (longitudinal) event IDs.
#' @param exclude character (vector). The value(s) to be excluded (Default:
#'   NULL; all values are used).
#' @param var_in character of length 1. Name of the field that contains the
#' longitudinal values or responses.
#' @param var_out character of length 1. Name of the new field that contains
#' one static value per `id` computed from the longitudinal values or
#' responses in `var_in`.
#'
#' @return Dataframe with two columns: `id` and `var_out`
#'
#' @export
#' @autoglobal
#'
#' @examples
#' data <- tibble::tribble(
#'   ~"id", ~"event", ~"values",
#'   "A", 1, NA,
#'   "A", 2, 2,
#'   "A", 3, 3,
#'   "B", 1, NA,
#'   "B", 2, NA,
#'   "B", 3, 1
#' )
#'
#' make_static(
#'   data,
#'   var_in = "values",
#'   var_out = "static_nothing_excluded",
#'   id = "id",
#'   event = "event"
#' )
#'
#' make_static(
#'   data,
#'   var_in = "values",
#'   var_out = "static_excluding_1and2",
#'   exclude = c("1", "2"),
#'   id = "id",
#'   event = "event"
#' )
#'
make_static <- function(data,
                        id = "participant_id",
                        event = "session_id",
                        exclude = NULL,
                        var_in,
                        var_out) {
  chk::chk_data(data)
  chk::chk_scalar(event)
  chk::chk_scalar(id)
  if (!is.null(exclude)) chk::chk_character(exclude)
  chk::chk_character(var_in)
  chk::chk_scalar(var_in)
  chk::check_names(data, c(id, event, var_in))
  chk::chk_character(var_out)
  chk::chk_scalar(var_out)
  # check_col_names(data, c(var_out, "tmp_col"))

  data |>
    mutate(
      tmp_col = if_else(
        .data[[var_in]] %in% exclude,
        NA,
        .data[[var_in]]
      )
    ) |>
    filter(
      !is.na(tmp_col)
    ) |>
    arrange(
      across(
        all_of(
          c(id, event)
        )
      )
    ) |>
    group_by(
      .data[[id]]
    ) |>
    reframe(
      !!var_out := tmp_col[1]
    ) |>
    right_join(
      data |> select(id) |> distinct(),
      join_by(!!id)
    )
}

find_data_norm <- function(data_norm) {
  # for internal use we can find the data_norm automatically
  # get the n - 1 call name
  n_call <- sys.calls()
  if (
    !is.null(data_norm) ||
      getOption("list_tscore", "") == "" ||
      length(n_call) == 2
  ) {
    return(data_norm)
  }

  func_name <- n_call[[length(n_call) - 2]] |>
    as.character() %>%
    {
      .[1]
    }

  # only works on functions that are compute_..._tscore
  if (!stringr::str_detect(func_name, "^compute_.*_tscore$")) {
    return(data_norm)
  }

  list_tscore_obj_name <- getOption("list_tscore")
  if (exists(list_tscore_obj_name, envir = globalenv())) {
    data_norm <- get_tscore_tbl(
      list_tscore = get(list_tscore_obj_name, envir = globalenv()),
      func_name = func_name
    )
  } else {
    chk::err(glue::glue(
      "The object '{list_tscore_obj_name}' is not found in environment. ",
      "Please read carefully of the internal usage part"
    ))
  }

  data_norm
}

#' Get T-score table from list of tscores (Internal)
#'
#' @description
#' This function retrieves the tscore table from a list of tscores based on the
#' function name. The function should be used internally.
#' @param list_tscore list. List of tscores. see details.
#' @param func_name character. The name of the function.
#' @return tbl. The tscore table. If there is no match or more than one match,
#'   an error will be thrown.
#' @export
#' @autoglobal
#' @details
#' The `list_tscore` should be a list of prepared tscore tables. The list has
#' two layers of structure: the first layer is the name of form, and the second
#' layer is the keyword of the tscore table.
#'
#' ```
#' list
#' |- form_1
#' |  |- keyword_1
#' |  |- keyword_2
#' |  |- ...
#' |- form_2
#' |  |- keyword_1
#' |  |- keyword_2
#' |  |- ...
#' |- ...
#' ```
#'
#' This object is prepared by the DSM team and for internal users, please ask
#' the DSM team for the `rds` file.
#'
#' ### Forms and keywords
#' Forms and keywords are based on the function names. A function should contain
#' both the form and keyword in its name, with only one exception being the
#' overall score of a form, which does not have a keyword. The function name
#' should be in the format of `compute_form_xx__keyword_tscore` or
#' `compute_form_xx_tscore`. The function name will be split by `_` and
#' the unique keywords will be used to search for the tscore table.
#' @examples
#' \dontrun{
#' list_tscore <- readRDS("aseba_tscore.rds")
#' get_tscore_tbl(list_tscore, "compute_mh_p_abcl__afs__frnd_tscore")
#' }
get_tscore_tbl <- function(
    list_tscore,
    func_name) {
  chk::chk_string(func_name)
  chk::chk_list(list_tscore)

  name_forms <- c(
    "mh_p_abcl",
    "mh_p_asr",
    "mh_p_cbcl",
    "mh_t_bpm",
    "mh_y_bpm",
    "mh_y_ysr"
  )
  # first extract all form specific tscores
  matched_forms <- stringr::str_detect(func_name, paste0("_", name_forms, "_"))
  if (sum(matched_forms) == 0) {
    chk::err(glue::glue("No form found for '{func_name}' in `list_tscore`"))
  }
  if (sum(matched_forms) > 1) {
    chk::err(glue::glue(
      "Multiple forms found for '{func_name}' in `list_tscore`: ",
      paste(name_forms[matched_forms], collapse = ", ")
    ))
  }
  list_tscore_form <- list_tscore[[name_forms[matched_forms]]]

  name_list_tscore_form <- names(list_tscore_form)
  func_name_keywords <- func_name |>
    stringr::str_split("_") |>
    unlist() |>
    unique() |>
    na.omit() %>%
    {
      .[. != ""]
    }

  # if the function name is overall score, get the TotProb
  if (stringr::str_detect(
    func_name,
    "^compute_mh_(p_abcl|p_asr|p_cbcl|t_bpm|y_bpm|y_ysr)_(tscore|sum|nm)$"
  )) {
    func_name_keywords <- "TotProb_"
  } else {
    func_name_keywords <- paste0("__", func_name_keywords, "_")
  }

  # see if the function name is in the list of tscores
  # only the first match from the right side is returned
  keyword_matched <- purrr::map(
    func_name_keywords,
    ~ stringr::str_detect(paste0(name_list_tscore_form, "_"), .x) %>%
      {
        name_list_tscore_form[.]
      }
  ) |>
    unlist() %>%
    {
      .[length(.)]
    } # from right means only the last match

  if (length(keyword_matched) == 0) {
    chk::err(glue::glue("No tscore table found for '{func_name}'"))
  }
  if (length(keyword_matched) > 1) {
    chk::err(glue::glue(
      "Multiple tscores table found for '{func_name}': ",
      paste(keyword_matched, collapse = ", ")
    ))
  }

  list_tscore_form[[keyword_matched]]
}


# other functions ---------------------------------------------------------

#' Check if a column name already exists in a data frame
#' @description
#' This function checks if a column name already exists in a data frame.
#' If the column name already exists, the function will abort with an error.
#'
#' @param data tbl. Data frame to check for the column name.
#' @param names character vector, The name(s) of the column to check for.
#' @return NULL. The function will abort with an error if the column name
#' already exists.
#' @export
#' @autoglobal
#' @keywords internal
#' @examples
#' data <- tibble::tibble(a = NA, b = NA, c = NA)
#' try({
#'   check_col_names(data, c("a", "b", "c"))
#'   check_col_names(data, c("a", "d"))
#' })
check_col_names <- function(data, names) {
  chk::chk_data(data)
  chk::chk_character(names)

  names_exist <- intersect(names, names(data))

  if (length(names_exist) > 0) {
    cli::cli_abort(
      message = c(
        "x" = "The data frame already has column(s) named `{names_exist}`.",
        "Please specify different column name(s)!"
      )
    )
  }
}

#' Markdown bullet point list
#'
#' @description
#' Creates a bullet point list in markdown format. Copy of
#' `gluedown::md_bullet()` but with the added ability to specify an indent to
#' create nested lists and the option to use code font.
#'
#' @param x character (vector). Text to convert into a bullet point list.
#' @param indent numeric, positive whole number. Number of spaces to indent the
#'   bullet point list by (Default: 0).
#' @param code logical. If the text will be formatted as code (Default: TRUE).
#' @param marker character. The bullet list marker to use (Default: "*").
#' @param italic logical. If the text will be formatted as italic
#' (Default: FALSE).
#' @return `glue` vector. A bullet point list in markdown format.
#'
#' @export
#' @autoglobal
#' @examples
#' md_bullet(c("First item", "Second item", "Third item"), code = TRUE)
#'
#' md_bullet(c("First item", "Second item", "Third item"), indent = 2)
md_bullet <- function(x,
                      indent = 0,
                      code = FALSE,
                      italic = FALSE,
                      marker = c("*", "-", "+")) {
  chk::chk_character(x)
  chk::chk_whole_number(indent)
  chk::chk_gte(indent, 0)
  chk::chk_logical(code)
  marker <- match.arg(marker)

  indent_chr <- strrep(" ", indent)
  if (code) x <- glue::glue("`{x}`")
  if (italic) x <- glue::glue("_{x}_")

  glue::glue("{indent_chr}{marker} {x}")
}

#' Insert references into help files
#'
#' @description
#' Inserts references into help files in markdown format. The function takes
#' the a single score name and returns the reference in markdown format.
#' @details
#' It is expected to have a table with the following columns in environment:
#' - `name`: The name of the scores
#' - `authors`: The authors of the paper
#' - `year`: The year of publication
#' - `title`: The title of the paper
#' - `journal`: The journal where the paper was published
#' - `volume_page`: The volume and page number of the paper, optional, can be
#' `""` if not available
#' - `doi`: The DOI of the paper, optional, can be `""` if not available
#'
#' @param name character, The name of the score to insert the reference for.
#' @param tbl_ref_name character, The name of the reference table object in the
#'  environment.
#' @keywords internal
#' @returns character (vector). The reference in markdown format.
#' @export
#' @autoglobal
#' @examples
#' tbl_ref <- tibble::tibble(
#'   name = c("score1", "score1", "score2"),
#'   authors = c(
#'     "Smith, B., Jones, A.",
#'     "Simon, J., Norman, D. A.",
#'     "Smith, B., Jones, A., Simon, J., Norman, D. A."
#'   ),
#'   year = c(2020, 2021, 2022),
#'   title = c(
#'     "Title of the First Paper",
#'     "Title of the Second Paper",
#'     "Title of the Third Paper"
#'   ),
#'   journal = c("Journal A", "Journal B", "Journal C"),
#'   volume_page = c("1(1): 1-10", "", "3(3): 21-30"),
#'   doi = c("https://10.1234/abc", "https://10.1234/def", "")
#' )
#' insert_reference("score1")
insert_reference <- function(
    name,
    tbl_ref_name = "tbl_ref") {
  chk::chk_string(name)
  chk::chk_string(tbl_ref_name)

  if (!exists(tbl_ref_name, envir = parent.frame())) {
    cli::cli_abort("Reference table not found with name: {tbl_ref_name}")
  }
  tbl_ref <- get(tbl_ref_name, envir = parent.frame())

  chk::chk_data(
    tbl_ref,
    x_name = c(
      "name", "authors", "year", "title",
      "journal", "volume_page", "doi"
    )
  )

  tbl_ref |>
    filter(name == !!name) |>
    mutate(
      ref = glue::glue(
        "* {authors} ({year}). {title}. _{journal}_",
        "{if_else(nchar(volume_page) > 0, paste0(', ', volume_page, '.'), '.')}",
        "{if_else(nchar(doi) > 0, paste0(' <', doi, '>.'), '')}"
      )
    ) |>
    pull(ref)
}
